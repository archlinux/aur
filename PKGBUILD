# Maintainer: Jonas Frei freijon <freijon@gmail.com>
# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi-indicator-bzr
pkgver=r32
pkgrel=1
pkgdesc="Provides an indicator for Haguichi. Development version."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'haguichi')
makedepends=('bzr' 'meson' 'vala')
conflicts=('haguichi-indicator')
provides=('haguichi-indicator')
source=('bzr+lp:haguichi-indicator')
sha256sums=('SKIP')
_pkg=haguichi-indicator

pkgver() {
  cd $_pkg

  echo "r$(bzr revno)"
}

build() {
  cd $_pkg
  rm -rf build
  mkdir build && cd build

  meson ..
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C $_pkg/build install
}
