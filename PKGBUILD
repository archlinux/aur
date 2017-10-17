# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Jingbei Li <i@jingbei.li>

_pkgname=libwebsockets
pkgname=libwebsockets-static
pkgver=2.4.0
pkgrel=1
pkgdesc='C library for lightweight websocket clients and servers (static library)'
arch=('i686' 'x86_64')
url=https://libwebsockets.org
license=('LGPL')
depends=('libpcap' 'openssl' 'zlib')
makedepends=('cmake')
source=("https://github.com/warmcat/libwebsockets/archive/v$pkgver.tar.gz")
sha512sums=('8c69c8a1e0cd00e8db5dcd552d1304b4f1936b349a72bf5be5862bf3b0d32ed136a06d1e6d1180abf7e3564eb99272aa83e116c5698faed54d148ebdee926768')

build() {
  cd $_pkgname-$pkgver
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DLWS_WITH_SHARED=OFF ..
  make
}

package() {
  cd $_pkgname-$pkgver
  install -Dm644 build/lib/libwebsockets.a "$pkgdir"/usr/lib/libwebsockets.a
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
