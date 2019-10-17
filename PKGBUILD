# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.3.5
pkgrel=2

pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('zlib')

conflicts=('zathura-pdf-poppler')

depends=('zathura' 'jbig2dec' 'openjpeg2' 'libjpeg' 'cairo' 'desktop-file-utils' 'openssl')
makedepends=('libmupdf' 'meson' 'ninja' 'git')

source=(zathura-pdf-mupdf-$pkgver.tar.gz::https://github.com/pwmt/zathura-pdf-mupdf/archive/$pkgver.tar.gz)

sha1sums=('c6131613568885ffdfceb45c4d629aebf4ed60be')

build() {
  cd zathura-pdf-mupdf-$pkgver
  arch-meson -Dlink-external=true build
  ninja -C build
}

package(){
  DESTDIR="$pkgdir" ninja -C zathura-pdf-mupdf-$pkgver/build install
  install -Dm0644 zathura-pdf-mupdf-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
