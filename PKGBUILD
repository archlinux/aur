# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on Aaron Paden <aaronbpaden@gmail.com> PKGBUILD for pcem
pkgname=pcem-git
_pkgname=pcem
pkgver=r1830.d09d5d0
pkgrel=2
pkgdesc="Emulator for various IBM PC computers and clones - development version"
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('wxgtk2' 'openal' 'sdl2' 'alsa-lib')
makedepends=('git' 'cmake')
conflicts=('pcem')
source=("git+https://github.com/sarah-walker-pcem/pcem.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/pcem"
  cmake .. -DCMAKE_BUILD_TYPE=Release .  -DUSE_NETWORKING=ON  -DUSE_ALSA=ON -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/pcem"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

