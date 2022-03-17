# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.8
pkgrel=1

pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg' 'openjpeg2' 'openssl' 'zathura')
makedepends=('libmupdf' 'meson' 'ninja' 'git')

source=(zathura-pdf-mupdf-$pkgver.tar.gz::https://github.com/pwmt/zathura-pdf-mupdf/archive/$pkgver.tar.gz
        0001-Remove-mupdf-linking-detection.patch)

sha256sums=('ba19c187fc8a441dcfb4d793624eadaea99e0d320b1e33ca25dd62be2b68bcea' SKIP)

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
