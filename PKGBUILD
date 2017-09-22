# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=ttyd
pkgver=1.3.3
pkgrel=1
pkgdesc='Share your terminal over the web'
arch=('x86_64')
url=https://tsl0922.github.io/ttyd/
license=('MIT')
depends=('json-c' 'libpcap' 'libwebsockets' 'zlib')
makedepends=('cmake' 'libwebsockets-static')
source=("ttyd-$pkgver.tar.gz::https://github.com/tsl0922/ttyd/archive/$pkgver.tar.gz")
sha512sums=('52591fa5a0a6bda623f0437b5900d7f22ad87a904a0d04710ac2f3d5fddbb9e1311b764339483b0820e416e646a62133c7598b88573120c86dd20f98aea0dfed')

build() {
  cd ttyd-$pkgver
  mkdir build -p && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ttyd-$pkgver/build
  make DESTDIR="$pkgdir" install

  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/ttyd/LICENSE
}

# vim:set ts=2 sw=2 et:
