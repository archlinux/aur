# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on Aaron Paden <aaronbpaden@gmail.com> PKGBUILD for pcem
pkgname=pcem-git
_pkgname=pcem
pkgver=17.r117.g60fefc6
pkgrel=1
pkgdesc="Emulator for various IBM PC computers and clones - development version"
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('wxgtk2' 'openal' 'sdl2' 'alsa-lib')
makedepends=('git' 'cmake' 'ninja')
conflicts=('pcem')
source=("git+https://github.com/sarah-walker-pcem/pcem.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
  cd "${srcdir}/pcem"
  cmake -G "Ninja" -DUSE_NETWORKING=ON -DUSE_ALSA=ON -DPLUGIN_ENGINE=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .  
  ninja
}

package() {
  cd "${srcdir}/pcem"
  DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:

