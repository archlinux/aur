# Maintainer: Jonas Frei freijon <freijon@gmail.com>
# Maintainer: Stephen Brandt <stephen@stephenbrandt.com>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=haguichi-bzr
pkgver=r259
pkgrel=1
pkgdesc="Provides a user friendly GUI to control the Hamachi client on Linux. Development version."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://www.haguichi.net"
license=('GPL3')
depends=('gtk3' 'libappindicator-gtk3' 'libnotify' 'logmein-hamachi')
makedepends=('bzr' 'meson' 'vala')
conflicts=('haguichi')
provides=('haguichi')
source=('bzr+lp:haguichi')
sha256sums=('SKIP')
_pkg=haguichi

pkgver() {
  cd $_pkg

  echo "r$(bzr revno)"
}

build() {
  cd $_pkg
  rm -rf build
  mkdir build && cd build

  meson -Denable-appindicator=true ..
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja -C $_pkg/build install
}
