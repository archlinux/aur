# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-celestial-navigation
pkgver=2.4.41.0
pkgrel=1
pkgdesc="Implements nautical almanac for sun, moon, planets, and various navigational stars. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/celestialnav.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/celestial_navigation_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/a001083af21de2e3faa970b245877a5ee5899aba.tar.gz")
b2sums=('7ee0be24e217396b11a69705bd1b71fece55bfbc55ea0490a1178406e71e7b3044b3c146b281493e9b2141488eb5de6818d7150aceb13d9ae4885a102ede015a' '24215376af8780b00e3611f2f9c2f3a408afcddfffc25c408117e0219eb0c70ca7805af349acb7616b900498d7b8e821db6ec2e18109247e81969f08b98a74aa')

prepare() {
  cp -r opencpn-libs-a001083af21de2e3faa970b245877a5ee5899aba/* celestial_navigation_pi-${pkgver}/opencpn-libs
}

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
