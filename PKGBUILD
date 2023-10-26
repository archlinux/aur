# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-polar
pkgver=1.2.6.0
pkgrel=1
pkgdesc="Polar creation plugin for OpenCPN"
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/polar.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/rgleason/polar_pi/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('95154f1d1df9f486bd6523a992bc9c8b14728230cdc037b4cde1211a4c2d75634e1356e16a609f02995ca7e1b66aa60adb13c947042890235df93b61cfd1b972')

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
