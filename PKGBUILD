# Maintainer: Fox Wilson <fwilson at lessbroken.org>

pkgname=virtualsmartcard
pkgver=0.7
pkgrel=2
pkgdesc="Virtual Smart Card emulates a smart card and makes it accessible through PC/SC"
url="http://sourceforge.net/projects/vsmartcard/"
arch=( "i686" "x86_64" )
license=( "GPLv3" )
depends=( "pcsclite" "python2" )
makedepends=( "help2man" )
source=( "http://downloads.sourceforge.net/project/vsmartcard/$pkgname/$pkgname-$pkgver.tar.gz" )
sha1sums=('cc608b91682d13b42604fae6238f57cd0da0135c')

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
