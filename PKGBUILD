# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=extractpdfmark-git
pkgver=1.1.0.r8.g73bd19c
pkgrel=1
pkgdesc="Extract page mode and named destinations as PDFmark from PDF"
url="https://github.com/trueroad/extractpdfmark"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('poppler')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' |tr - .|cut -c2-
}

build() {
  cd ${pkgname%-git}
  ./autogen.sh
  ./configure --prefix=/usr --with-poppler=cpp
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
}
