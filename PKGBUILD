# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=pacana
pkgver=0.13
pkgrel=1
pkgdesc="Pacman repository analysis tool"
arch=('i686' 'x86_64')
url="https://github.com/bbidulock/pacana"
license=('GPL')
depends=('pacman' 'json-c')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
md5sums=('4382596088dc641288e3af2616751b44')

build() {
  cd $pkgname-$pkgver
  ./configure
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
