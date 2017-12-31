# Maintainer: Timo Sarawinski (t.sarawinski@gmail.com)
#Substantially adapted from the PKGBUILD of isl-git

pkgname=isl17
pkgver=0.17.1
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints"
arch=('i686' 'x86_64' 'armv7h')
url="http://isl.gforge.inria.fr/"
depends=('gmp')
license=('MIT')
options=('!libtool')
provides=("isl=${pkgver}")
conflicts=('isl-git' 'isl')
source=('http://isl.gforge.inria.fr/isl-0.17.1.tar.gz')
md5sums=('62e67de754e9dce25758892cd4a93b75')

build() {
  cd isl-0.17.1
#  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd isl-0.17.1
  make check
}

package() {
  cd isl-0.17.1
  make -j1 DESTDIR="$pkgdir/" install

  install -dm755 $pkgdir/usr/share/gdb/auto-load/usr/lib/
  mv $pkgdir/{,/usr/share/gdb/auto-load/}usr/lib/libisl.so.15.2.1-gdb.py

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/isl/LICENSE
}
