# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-weatherfax
pkgver=1.9.111.1
pkgrel=1
pkgdesc="Open image files directly, or decode audio faxes to an image. Plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
optdepends=('rtl-sdr: decode from rtlsdr')
makedepends=('cmake' 'git')
url="https://opencpn.org/OpenCPN/plugins/weatherfax.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/weatherfax_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/a001083af21de2e3faa970b245877a5ee5899aba.tar.gz")
b2sums=('5230f7199ad4de77e62830c7319363e5d0f416c4ea9c81611d6b3e0b87d4c130563a08bdde2f9228d2ec3ec0bf05d5486409da6569b0d13d0cb5d51663c01907' '24215376af8780b00e3611f2f9c2f3a408afcddfffc25c408117e0219eb0c70ca7805af349acb7616b900498d7b8e821db6ec2e18109247e81969f08b98a74aa')

prepare() {
  cp -r opencpn-libs-a001083af21de2e3faa970b245877a5ee5899aba/* weatherfax_pi-${pkgver}/opencpn-libs
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
