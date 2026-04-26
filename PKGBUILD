# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-celestial-navigation
pkgver=2.4.66.0
pkgrel=1
pkgdesc="Implements nautical almanac for sun, moon, planets, and various navigational stars. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/celestialnav.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/celestial_navigation_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/6a5616930143528470442e376349ccc2be7800b4.tar.gz" "stdint.patch")
b2sums=('b6c5e79767010b007e9b8f382928c06af46cb591a951a5c080f697972ae253b074c70b57382167507d31c30ee848d4e72e06245017e61fa6192800e49a2ea092' 'ef0c05e6a55dda4fdec5020a4868aa55442d55748de211127473753ea4f72920fc52dbbfcb1a99b571a0321cc86f2ce7d1168b5e1d0a54470aaa3690d648d788'  '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-6a5616930143528470442e376349ccc2be7800b4/* celestial_navigation_pi-${pkgver}/opencpn-libs
  cd celestial_navigation_pi-$pkgver
  patch --strip=1 --input=../stdint.patch
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
