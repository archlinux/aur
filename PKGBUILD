# Maintainer: uli <cybuzuma at vnxs dot de>
# Contributor: guenael

pkgname=opencpn-plugin-draw
pkgver=1.8.58.0
pkgrel=1
pkgdesc="Drawing Plugin to allow extra objects to be drawn and used within OCPN"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/draw.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/jongough/ocpn_draw_pi/archive/refs/tags/v${pkgver}.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/3a6300a8be3b3480c6737375b5c7866ec76238ab.tar.gz")
b2sums=('172dc6e452d19eef73a411f9ed5ddcefca0ffacb141d252a78be572be3bf16dc22dbee3c47d5806c1ac86cf8674208db5497f7642acc26444999fd987cb16f9d' 'cf324bec209f2e6d9982f8d441575520eb100d18eda6d1bfbaf488f9ddacc9943704b693767036790451ec780bf6c060f7570e9c757d21e4980c8ff558abd299')

prepare() {
  cp -r opencpn-libs-3a6300a8be3b3480c6737375b5c7866ec76238ab/* ocpn_draw_pi-${pkgver}/opencpn-libs
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
