# Maintainer: Cody <aur AT codyps.com>

pkgname=ignition-plugin
_base=${pkgname##ignition-}
_major=1
pkgver=1.1.0
pkgrel=1
pkgdesc="Library for registering plugin libraries and dynamically loading them at runtime."
arch=('i686' 'x86_64')
url="https://github.com/ignitionrobotics/ign-${_base}"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'ninja' 'ignition-cmake')
source=(
  "https://github.com/ignitionrobotics/ign-${_base}/archive/${pkgname}_${pkgver}.tar.gz"
)
md5sums=('26092f1aa1c9eff0393e0e965b1b8ddc')
sha1sums=('d2e0901c7d7c746ab33c360908aaee79673e8240')

prepare() {
  rm -rf build
  mkdir -p build
}

build() {
  cd build
  cmake -G Ninja \
    -D CMAKE_BUILD_TYPE=NONE \
    -D CMAKE_INSTALL_PREFIX=/usr \
    "../ign-${_base}-${pkgname}_${pkgver}"

  ninja -v
}

package() {
  cd build
  DESTDIR="${pkgdir}/" ninja install
}

# vim:set ts=2 sw=2 et:
