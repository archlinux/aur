# Maintainer: Kyle Keen <keenerd@gmail.com?>
pkgname=pcb-rnd
_pkgname=pcb-rnd
pkgver=r2689
pkgrel=1
pkgdesc="Fork of Geda-PCB with embedded scripting and other improvements."
url="http://repo.hu/projects/pcb-rnd/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gd' 'libjpeg' 'lesstif' 'gtk2')
# - glib and gtk if you are using the gtk frontend
# - motif or lesstif if you are using the lesstif frontend
# - gdlib if you are using the png HID
makedepends=('svn')
provides=('pcb-rnd')
conflicts=('pcb-rnd')
source=("svn://repo.hu/pcb-rnd/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk/"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk/"
  # many knobs under ./configure --help
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/trunk/"
  # prefix?  DESTDIR? install_root?
  make -j1 install_root="$pkgdir" install
}
