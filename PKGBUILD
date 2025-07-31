# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-celestial-navigation
pkgver=2.4.65.0
pkgrel=1
pkgdesc="Implements nautical almanac for sun, moon, planets, and various navigational stars. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/celestialnav.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/celestial_navigation_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/433aed02b6dbf1b34709e44aea038f5c853bec79.tar.gz" "stdint.patch")
b2sums=('575b05ded2933223e595106fbc4fb98c563a6c200237c385dde239168767cf096a7c99c5fb64f33d517580ae44bc583bf6b9a01bab54d53d0eae619d7218c52e' '796d27913c7b13797def24998232f1b58f9482e376d53d6ea89e500294919220fc32ea4ef4400485cf6ae816ca919f6fb34ad0d5decf5072e04cf1561299ef1f'  '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-433aed02b6dbf1b34709e44aea038f5c853bec79/* celestial_navigation_pi-${pkgver}/opencpn-libs
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
