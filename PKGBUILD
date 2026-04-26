# Maintainer: uli <cybuzuma at vnxs dot de>
# Contributor: guenael

pkgname=opencpn-plugin-draw
pkgver=1.10.0.0
pkgrel=1
pkgdesc="Drawing Plugin to allow extra objects to be drawn and used within OCPN"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/draw.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/jongough/ocpn_draw_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/bb41d9a8246e17e5e156f4a12f1587e4cd69688c.tar.gz" "stdint.patch")
b2sums=('f86ed51e441e7914a11bf27e84624a86e44f4435e6c9ef2b5258f594644ac97711a0cdf209b3ca5e59990651f8eb6e860f5b8772d2ba4d443f5bd76f1e857abe' '805f44c800e42c9353d71c69503dd46b56bfde05d0a9a9b22a306dedc2736cc2c73bbf0f77345f2e57417c8ced3b19578d1e1cf80cf8452b13101bc1cf085e33' '5e2554dc67a86bb530b5987ec4b311a2b561a035c6920d4db8e4036d0b99234553871e9a2dde194ce0274296fecb1d0738465f3419f73b887674a232c7ee2932')

prepare() {
  cp -r opencpn-libs-bb41d9a8246e17e5e156f4a12f1587e4cd69688c/* ocpn_draw_pi-${pkgver}/opencpn-libs
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
