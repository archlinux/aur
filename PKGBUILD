# Maintainer: Fox Wilson <fwilson at lessbroken.org>

pkgname=virtualsmartcard
pkgver=0.11
pkgrel=1
pkgdesc="Virtual Smart Card emulates a smart card and makes it accessible through PC/SC"
url="https://github.com/frankmorgner/vsmartcard"
arch=( "i686" "x86_64" )
license=( "GPLv3" )
depends=( "pcsclite" "python3" )
makedepends=( "help2man" )
source=( "https://github.com/frankmorgner/vsmartcard/releases/download/$pkgname-$pkgver/$pkgname.zip" )
sha1sums=('d3be90375ed8f2ce5bcb88704a376ff8a5ec9472')

prepare() {
  cd "$srcdir"/
  tar -xf $pkgname-$pkgver.tar.gz
}

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
