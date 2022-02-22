# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on Aaron Paden <aaronbpaden@gmail.com> PKGBUILD for pcem
pkgname=pcem-git
_pkgname=pcem
pkgver=17.r127.g60c5656
pkgrel=1
pkgdesc="Emulator for various IBM PC computers and clones - development version"
url="http://pcem-emulator.co.uk/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('wxgtk2' 'openal' 'sdl2' 'alsa-lib')
makedepends=('git' 'ninja' 'meson')
conflicts=('pcem')
source=("git+https://github.com/sarah-walker-pcem/pcem.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
  cd "${srcdir}/pcem"
  meson --buildtype release build --prefix=/usr --sysconfdir=/etc -Duse-alsa=true -Duse-plugin-engine=true -Duse-networking=true 
  cd build
  ninja
}

package() {
  cd "${srcdir}/pcem/build"
  DESTDIR="$pkgdir" ninja install
}

# vim:set ts=2 sw=2 et:

