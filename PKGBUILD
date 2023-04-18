# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-climatology
pkgver=1.5.4.0
pkgrel=1
pkgdesc="Climatology plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/climatology.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/climatology_pi/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('aafde41da34601e51671478c601ac0ed1967b970adc75033987f6a6bc676014ca5648548f1a1e98b40b2fbc498f7f099d855ef98cfb4ea025b9188cf669319c0')
          
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
