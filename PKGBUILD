# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherrouting
pkgver=1.14.0.0
pkgrel=1
pkgdesc="Weather routing plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3" "CCPL:by")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/weatherroute.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/weather_routing_pi/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d013ab7a99d21dcbd1c7a7d7b112bc6df1f8a9a501448eed9b022375285b6e8b563d6f50e36927261f10acfb56f048b901db3b67778ff7a9ec8624e909408f41')

build() {
  cd weather_routing_pi-${pkgver}
  mkdir -p build
  cd build
  BUILD_GTK3=TRUE cmake -DCMAKE_BUILD_TYPE=Release -DPlugin_CXX11=ON -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd weather_routing_pi-${pkgver}/build
  DESTDIR="$pkgdir" make install
}
