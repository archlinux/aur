# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-polar
pkgver=1.2.31.0
pkgrel=1
pkgdesc="Polar creation plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/polar.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/polar_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/a001083af21de2e3faa970b245877a5ee5899aba.tar.gz")
b2sums=('4bd0c4cfb1a1259b15e9f66bbdeccb5d803d78562ccd89f681100e4843108448cbde509c2c49d9e9874c525a7f53b4e5758b819fbc1d230edbaf513d311212ec' '24215376af8780b00e3611f2f9c2f3a408afcddfffc25c408117e0219eb0c70ca7805af349acb7616b900498d7b8e821db6ec2e18109247e81969f08b98a74aa')

prepare() {
  cp -r opencpn-libs-a001083af21de2e3faa970b245877a5ee5899aba/* polar_pi-$pkgver/opencpn-libs
}

build() {
  cd polar_pi-$pkgver
  mkdir -p build
  cd build
  #Force GTK3, enable CXX11
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DPlugin_CXX11=ON -DUSE_GL=ON ..
  make
}

package() {
  cd polar_pi-$pkgver/build/
  DESTDIR="$pkgdir" make install
}
