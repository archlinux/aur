# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.3
pkgrel=1

pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('zathura' 'jbig2dec' 'openjpeg2' 'cairo' 'desktop-file-utils' 'openssl')
makedepends=('libmupdf' 'meson' 'ninja')

source=(https://pwmt.org/projects/zathura/plugins/download/zathura-pdf-mupdf-$pkgver.tar.xz)

sha1sums=('a9165f6aec134de86d6ee5c1a2ed5f1aa8f7d0b3')

build() {
  cd zathura-pdf-mupdf-$pkgver
  arch-meson build
  ninja -C build
}

package(){
  DESTDIR="$pkgdir" ninja -C zathura-pdf-mupdf-$pkgver/build install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
