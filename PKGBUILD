# Maintainer: uli <cybuzuma at vnxs dot de>
# Contributor: guenael

pkgname=opencpn-plugin-draw
pkgver=1.8.60.0
pkgrel=1
pkgdesc="Drawing Plugin to allow extra objects to be drawn and used within OCPN"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/draw.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/jongough/ocpn_draw_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/3d56fe895583c06e66679ce76f66e781dfa740e0.tar.gz" "stdint.patch")
b2sums=('eb1f024e2066e50d9a114b5c4f8a6bfe03823fbdf2e192882efb737afa03cbbb37ed2c4ba96f6a07809e4640a9646548bc4c965905f71e2d58bf2aa6717dc482' '52a4491ac88fc7c70106d2a3f35c9403134bb5fa82c5487e3312636c8fa963dd3a4d829cb3ecb1e670b43b0731d3255c9af0175ad941462a530524c34e8a7ab1' '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-3d56fe895583c06e66679ce76f66e781dfa740e0/* ocpn_draw_pi-${pkgver}/opencpn-libs
  cd ocpn_draw_pi-${pkgver}
  patch --strip=1 --input=../stdint.patch
}

build() {
  cd ocpn_draw_pi-${pkgver}
  mkdir -p build
  cd build
  BUILD_GTK3=TRUE cmake -DCMAKE_BUILD_TYPE=None -Wno-dev -Dplugin_target=AUR -DPlugin_CXX11=ON -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ..
  make
}

package() {
  cd ocpn_draw_pi-${pkgver}
  cd build
  DESTDIR="$pkgdir" make install
}
