# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-climatology
pkgver=1.6.31
pkgrel=1
pkgdesc="Climatology plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/climatology.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/climatology_pi/archive/refs/tags/v$pkgver.tar.gz" "$pkgname-$pkgver-opencpnlibs.tar.gz::https://github.com/OpenCPN/opencpn-libs/archive/a001083af21de2e3faa970b245877a5ee5899aba.tar.gz")
b2sums=('d687a0caf677c1a7f5e1c316d7c710cfaf155e1064fd53d1b0220318054463bce2683c23c9f497e4784d667de5e95bed6c32c3942a57997426c67fc479b7bc76' '24215376af8780b00e3611f2f9c2f3a408afcddfffc25c408117e0219eb0c70ca7805af349acb7616b900498d7b8e821db6ec2e18109247e81969f08b98a74aa')

prepare() {
  cp -r opencpn-libs-a001083af21de2e3faa970b245877a5ee5899aba/* climatology_pi-$pkgver/opencpn-libs
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
