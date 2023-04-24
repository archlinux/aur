# Maintainer: cybuzuma <cybuzuma at vnxs dot de>
# Contributor: Romain Bazile <gromain.baz@gmail.com>

pkgname=opencpn-plugin-route
pkgver=1.2_ov50
pkgrel=1
pkgdesc="Route Plotting plugin aka 'Great Circle Route' plugin for OpenCPN."
arch=('x86_64' 'aarch64')
license=("GPL3")
depends=('opencpn')
makedepends=('cmake')
url="https://opencpn.org/OpenCPN/plugins/route.html"
source=("$pkgname-$pkgver.tar.gz::https://github.com/SaltyPaws/route_pi/archive/refs/tags/v${pkgver//_/-}.tar.gz")
b2sums=('2dac5a8f56bcce469acbda6b4a08d077dc0f8fca223a7576056dd159638456b41c5513c0aedb4e70043c22fbacb08b5fe3d75d99a90355ade2a713ed8c666e7b')

build() {
  cd route_pi-${pkgver//_/-}
  mkdir -p build
  cd build
  #Force GTK3
  BUILD_GTK3=TRUE cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd route_pi-${pkgver//_/-}/build/
  DESTDIR="$pkgdir" make install
}
