# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=isl-git
_gitname=isl
pkgver=0.14.1.496.g47edc76
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints (development version)"
arch=('i686' 'x86_64')
url="http://isl.gforge.inria.fr/"
depends=('gmp')
license=('MIT')
options=('!libtool')
provides=('isl')
conflicts=('isl')
source=('git://repo.or.cz/isl.git')
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --always | sed -e 's|^isl-||' -e 's|-|.|g'
}

build() {
  cd "$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_gitname"
  make check
}

package() {
  cd "$_gitname"
  make -j1 DESTDIR="$pkgdir/" install

  install -dm755 $pkgdir/usr/share/gdb/auto-load/usr/lib/
  mv $pkgdir/{,/usr/share/gdb/auto-load/}usr/lib/libisl.so.13.1.1-gdb.py

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/isl/LICENSE
}
