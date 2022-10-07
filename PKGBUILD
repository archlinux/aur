# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-celestial-navigation
pkgver=2.3.15.0
pkgrel=1
pkgdesc="Implements nautical almanac for sun, moon, planets, and various navigational stars. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/celestialnav.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/celestial_navigation_pi/archive/refs/tags/v2.3.15.0.tar.gz")
b2sums=('8ec1cfcc618404848f9e468f716185678d61d982cd7efa40c39d198f685874c4c94789e73f873370a31b2c6216bca668fe4750720c90adf7d5cff2679033b8bc')

build() {
  cd celestial_navigation_pi-$pkgver
  mkdir -p build
  cd build
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON  ..
  make
}

package() {
  cd celestial_navigation_pi-$pkgver/build
  DESTDIR="$pkgdir" make install
}
