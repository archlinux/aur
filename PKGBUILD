# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_pkgname=lincity-ng
pkgname=${_pkgname}-git
epoch=1
pkgver=2.9.0.r151.g6e92aa57
pkgrel=1
pkgdesc="A city simulation game (development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/lincity-ng/lincity-ng"
license=('GPL2')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%.r*}")
depends=('sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'sdl2_gfx' 'physfs' 'libxml2' 'libgl')
makedepends=('git' 'cmake' 'mesa' 'glu')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^lincity-ng-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd ${_pkgname}
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package () {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}
