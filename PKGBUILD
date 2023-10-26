# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherfax
pkgver=1.9.110.0
pkgrel=1
pkgdesc="Open image files directly, or decode audio faxes to an image. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
optdepends=('rtl-sdr: decode from rtlsdr')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/weatherfax.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/weatherfax_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/9e502bf1cfe1101e6f60e2dfb57a45e8a8fbccdc.tar.gz")
b2sums=('096ea5f411e0aa4f9df18b7871a50fbf034d0e008f56f0ba326fe69bb45446b86663e6c549067afde03eb0d43aca3a9cfc7de7955292670a1552514be58c7e59' 'c7fb21369f732cb4256997317f40c1ea269153782f879d8e4a7a72c4c31aa80053f810c0ed26f3ac8ae8142757d29f210366fee4d5d185c40926ad27f0c8d5c5')

prepare() {
  cp -r opencpn-libs-9e502bf1cfe1101e6f60e2dfb57a45e8a8fbccdc/* weatherfax_pi-${pkgver}/opencpn-libs
}

build() {
  cd weatherfax_pi-$pkgver
  mkdir -p build
  cd build
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON -DUSE_GL=ON ..
  make
}

package() {
  cd weatherfax_pi-$pkgver/build
  DESTDIR="$pkgdir" make install
}
