# Maintainer: Timo Sarawinski (t.sarawinski@gmail.com)
#Substantially adapted from the PKGBUILD of isl-git

pkgname=isl16
pkgver=0.16
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints"
arch=('i686' 'x86_64' 'armv7h')
url="http://isl.gforge.inria.fr/"
depends=('gmp')
license=('MIT')
options=('!libtool')
provides=("isl=${pkgver}")
conflicts=('isl-git' 'isl')
source=('http://isl.gforge.inria.fr/isl-0.16.tar.gz')
md5sums=('b556a88ad24a42996066383e99826b42')

build() {
  cd isl-0.16
#  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd isl-0.16
  make check
}

package() {
  cd isl-0.16
  make -j1 DESTDIR="$pkgdir/" install

  install -dm755 $pkgdir/usr/share/gdb/auto-load/usr/lib/
  mv $pkgdir/{,/usr/share/gdb/auto-load/}usr/lib/libisl.so.15.1.0-gdb.py

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/isl/LICENSE
}
