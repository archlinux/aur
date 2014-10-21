# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>

_pkgname=libdwarf
pkgname=${_pkgname}-git
pkgver=20140910
pkgrel=2
pkgdesc="A library for handling DWARF Debugging Information Format"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://www.prevanders.net/dwarf.html"
depends=('elfutils')
makedepends=('git')
source=("libdwarf"::"git://git.code.sf.net/p/libdwarf/code")
md5sums=('SKIP')
provides=('libdwarf')
conflicts=('libdwarf')
options+=('staticlibs')

build() {
  cd "$srcdir"/libdwarf
  ./configure --prefix=/usr --enable-shared
  make
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  cd "$srcdir"/libdwarf/libdwarf

  install -d $pkgdir/usr/lib
  install -m 644 libdwarf.a $pkgdir/usr/lib
  install -m 644 libdwarf.so $pkgdir/usr/lib

  install -d $pkgdir/usr/include/libdwarf
  install dwarf.h libdwarf.h $pkgdir/usr/include/libdwarf

  install -dm 755 $pkgdir/usr/share/doc/${_pkgname}
  install README NEWS *.pdf $pkgdir/usr/share/doc/${_pkgname}

  # dwarfdump
  cd "$srcdir"/libdwarf/dwarfdump2
  install -Dm755 dwarfdump $pkgdir/usr/bin/dwarfdump
  install -Dm644 dwarfdump.1 $pkgdir/usr/share/man/man1/dwarfdump.1
  install -Dm644 dwarfdump.conf $pkgdir/usr/lib/dwarfdump.conf
}
