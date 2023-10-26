# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherrouting
pkgver=1.15.17.0
pkgrel=1
pkgdesc="Weather routing plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3" "CCPL:by")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/weatherroute.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/weather_routing_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/9e502bf1cfe1101e6f60e2dfb57a45e8a8fbccdc.tar.gz")
b2sums=('3b74f478d2f66a0d5f97b5c83ddcafc0074375b8816efa002f5568a996df91da0540d2096a226c2b773367e4e03d61cc09703526083daf6f8159cbd20b26eb73' 'c7fb21369f732cb4256997317f40c1ea269153782f879d8e4a7a72c4c31aa80053f810c0ed26f3ac8ae8142757d29f210366fee4d5d185c40926ad27f0c8d5c5')

prepare() {
  cp -r opencpn-libs-9e502bf1cfe1101e6f60e2dfb57a45e8a8fbccdc/* weather_routing_pi-${pkgver}/opencpn-libs
}

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
