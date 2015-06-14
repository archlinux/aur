# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Pierre DOUCET <pierre at equinoxefr.org>

pkgname=pcb2gcode-git
_pkgname=pcb2gcode
pkgver=r144.05e093f
pkgrel=1
pkgdesc="Gerber to gcode file converter" 
arch=('i686' 'x86_64')
url="https://github.com/patkan/pcb2gcode"
license=('GPL')
makedepends=('git' 'boost')
depends=('gtkmm' 'boost-libs' 'gerbv-git')
provides=('pcb2gcode')
conflicts=('pcb2gcode')
md5sums=('SKIP')
source=("$_pkgname"::'git://github.com/pcb2gcode/pcb2gcode.git')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  libtoolize
  aclocal
  automake --add-missing
  autoreconf
  ./configure --prefix=/usr
  make -j
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
