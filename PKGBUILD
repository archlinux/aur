# Maintainer: Fox Wilson <fwilson at lessbroken.org>

pkgname=virtualsmartcard
pkgver=0.9
pkgrel=1
pkgdesc="Virtual Smart Card emulates a smart card and makes it accessible through PC/SC"
url="https://github.com/frankmorgner/vsmartcard"
arch=( "i686" "x86_64" )
license=( "GPLv3" )
depends=( "pcsclite" "python3" )
makedepends=( "help2man" )
source=( "https://github.com/frankmorgner/vsmartcard/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz" )
sha1sums=('9ce6117f307e28696699f87672681454ee001bf0')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/
  make PYTHON="/bin/python3"
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make PYTHON="/bin/python3" DESTDIR="$pkgdir" install

  cd "$pkgdir"
  mv lib/* usr/lib
  rmdir lib
  mv bin usr
}
