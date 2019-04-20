# Maintainer: Milk Brewster (milk on freenode)
_pkgname=remid.lv2
pkgname=${_pkgname}-git
pkgver=r84.7427f1b
pkgrel=1
pkgdesc="An lv2 port of the midi controlled implementation of the MOS8580 6581 SID chip used in the Commodore 64."
arch=('i686' 'x86_64')
url='https://github.com/ssj71/reMID.lv2'
license=('GPL')
groups=('lv2-plugins')
depends=('glib2' 'jack' 'lv2' 'alsa-lib')
makedepends=('cmake' 'pkgconfig')
provides=('remid.lv2' 'remid.lv2-git')
conflicts=('remid.lv2' 'remid.lv2-git')
replaces=()
backup=()
options=()
install=
source=("remid.lv2::git+https://github.com/ssj71/reMID.lv2")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build
  cmake .. . -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
  cd "$srcdir/$_pkgname"
  cd build
  make
}

package() {
  cd "$srcdir/$_pkgname"
  cd build
  DESTDIR="$pkgdir/" make install
}

check() {
  cd "$srcdir/$_pkgname/build"

  # ARGS='-VV' make test
}

# vim:set ts=2 sw=2 et:
