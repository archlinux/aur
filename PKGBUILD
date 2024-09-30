# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherrouting
pkgver=1.15.18.6
pkgrel=1
pkgdesc="Weather routing plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3" "CCPL:by")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/weatherroute.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/weather_routing_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/a001083af21de2e3faa970b245877a5ee5899aba.tar.gz")
b2sums=('db1c6f237f1547c6c2e4475290895dbdcd9a17ab01b367a633ae54dc8cc2988835b0e2cef6539dab19af8d7e3f9536b07f2d96774aa70a653b72be6727dc91fe' '24215376af8780b00e3611f2f9c2f3a408afcddfffc25c408117e0219eb0c70ca7805af349acb7616b900498d7b8e821db6ec2e18109247e81969f08b98a74aa')

prepare() {
  cp -r opencpn-libs-a001083af21de2e3faa970b245877a5ee5899aba/* weather_routing_pi-${pkgver}/opencpn-libs
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
