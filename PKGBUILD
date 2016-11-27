# Maintainer: Liam Greenough (beacon515@gmail.com)
#Substantially adapted from the PKGBUILD of isl-git

pkgname=isl14
pkgver=0.14
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints"
arch=('i686' 'x86_64' 'armv7h')
url="http://isl.gforge.inria.fr/"
depends=('gmp')
license=('MIT')
options=('!libtool')
provides=("isl=${pkgver}")
conflicts=('isl-git' 'isl')
source=('http://isl.gforge.inria.fr/isl-0.14.1.tar.xz')
md5sums=('94fcd11e0b1c79250ae341affb1845ea')

build() {
  cd isl-0.14.1
#  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd isl-0.14.1
  make check
}

package() {
  cd isl-0.14.1
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir"/usr/share/gdb/auto-load/usr/lib/
  mv "$pkgdir"/usr/lib/libisl.so.*-gdb.py "$pkgdir"/usr/share/gdb/auto-load/usr/lib/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/isl/LICENSE
}
