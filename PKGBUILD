# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherrouting
pkgver=1.15.45.7
pkgrel=1
pkgdesc="Weather routing plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3" "CCPL:by")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/weatherroute.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/weather_routing_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/823c5d8bbb31546f3aee3d75a70568a46ff4cb04.tar.gz" "stdint.patch")
b2sums=('81c3dce6c1ec1fd9c8a84ae9bd164df74623489b7519a74ac75b396b55a58cef7776666e2b83475ad54b0dc79302f92ebe8a66d6cc7b3842b7be78ff9febe06e' 'a2d6a4b0f9ad277f0633f955db3e413637d829e02976f202683245f54b9dc8f4e5e924a8e6646df3efd6cd409cb19b7a14f2cb042542e786e3dea0e5f7e9c2b3'  '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-823c5d8bbb31546f3aee3d75a70568a46ff4cb04/* weather_routing_pi-${pkgver}/opencpn-libs
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
