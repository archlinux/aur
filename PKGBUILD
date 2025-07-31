# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherrouting
pkgver=1.15.33.2
pkgrel=1
pkgdesc="Weather routing plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3" "CCPL:by")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/weatherroute.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/weather_routing_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/433aed02b6dbf1b34709e44aea038f5c853bec79.tar.gz" "stdint.patch")
b2sums=('0817f0c28e4545ed70c90f1d4c5c87c7e7b0587a1d76ca6f433512d17372bd25d97254193628f2b0fbd674b002d02bf53891337661e1f58d7ae8865466cea7d5' '796d27913c7b13797def24998232f1b58f9482e376d53d6ea89e500294919220fc32ea4ef4400485cf6ae816ca919f6fb34ad0d5decf5072e04cf1561299ef1f'  '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-433aed02b6dbf1b34709e44aea038f5c853bec79/* weather_routing_pi-${pkgver}/opencpn-libs
  cd weather_routing_pi-${pkgver}
  patch --strip=1 --input=../stdint.patch
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
