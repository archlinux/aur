# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# # Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-polar
pkgver=1.2.2.0
pkgrel=1
pkgdesc="Polar creation plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/polar.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/polar_pi/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('1fd4f615683f354ce751071b6b480708ceff7c933ca370ce4e93d0a97e49bcaf85e52e8219799471954f6495b97ed8f6e2fdd54977060cb0746eb73612187b8d')

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
