# Maintainer: Fox Wilson <fwilson at lessbroken.org>

pkgname=virtualsmartcard
pkgver=0.8
pkgrel=1
pkgdesc="Virtual Smart Card emulates a smart card and makes it accessible through PC/SC"
url="https://github.com/frankmorgner/vsmartcard"
arch=( "i686" "x86_64" )
license=( "GPLv3" )
depends=( "pcsclite" "python2" )
makedepends=( "help2man" )
source=( "https://github.com/frankmorgner/vsmartcard/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz" )
sha1sums=('17f21cc4089c589312d38f0f6c5cd8f9bb2cbc02')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --prefix=/
  make PYTHON="/bin/python2"
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make PYTHON="/bin/python2" DESTDIR="$pkgdir" install

  cd "$pkgdir"
  mv lib/* usr/lib
  rmdir lib
  mv bin usr
}
