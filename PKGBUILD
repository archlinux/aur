# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-climatology
pkgver=1.6.30.0
pkgrel=1
pkgdesc="Climatology plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/climatology.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/climatology_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/9e502bf1cfe1101e6f60e2dfb57a45e8a8fbccdc.tar.gz")
b2sums=('bda1c1088b85db0b0e0ce72c84c4e63cf5ebf05fbfa051d61b2ab91c0e4d3b7ef1912a289d0e6705381f1cea9f6986fe50b079f6aa18c04aabddd86640ecc092' 'c7fb21369f732cb4256997317f40c1ea269153782f879d8e4a7a72c4c31aa80053f810c0ed26f3ac8ae8142757d29f210366fee4d5d185c40926ad27f0c8d5c5')

prepare() {
  cp -r opencpn-libs-9e502bf1cfe1101e6f60e2dfb57a45e8a8fbccdc/* climatology_pi-$pkgver/opencpn-libs
}
          
build() {
  cd climatology_pi-$pkgver
  mkdir -p build
  cd build
  #Force GTK3, suppress cmake warnings, allow C++11
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON ..
  make
}

package() {
  cd climatology_pi-$pkgver/build
  DESTDIR="$pkgdir" make install
}
