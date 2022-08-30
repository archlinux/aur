# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.9
pkgrel=1

pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg' 'openjpeg2' 'openssl' 'zathura')
makedepends=('libmupdf' 'meson' 'ninja' 'git')

source=(zathura-pdf-mupdf-$pkgver.tar.gz::https://pwmt.org/projects/zathura-pdf-mupdf/download/zathura-pdf-mupdf-$pkgver.tar.xz
        0001-Remove-mupdf-linking-detection.patch)

sha256sums=('77f795ea1745b695a50b6864e73569d4ed8ac0eaa4ee2e6069e725c932057c07'
            '8b51563a782a7dea38711335354bf65e2303b06bfecacf9cc060ecfc7b0851b8')

prepare() {
  cd zathura-pdf-mupdf-$pkgver
  patch -p1 <"$srcdir"/0001-Remove-mupdf-linking-detection.patch
}

build() {
  cd zathura-pdf-mupdf-$pkgver
  arch-meson build
  ninja -C build
}

package(){
  DESTDIR="$pkgdir" ninja -C zathura-pdf-mupdf-$pkgver/build install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
