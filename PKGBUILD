# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Jingbei Li <i@jingbei.li>

_pkgname=libwebsockets
pkgname=libwebsockets-static
pkgver=2.4.0
pkgrel=1
pkgdesc='C library for lightweight websocket clients and servers (static library)'
arch=('x86_64')
url=https://libwebsockets.org
license=('LGPL')
depends=('libpcap' 'openssl' 'zlib')
makedepends=('cmake')
source=("libwebsockets-$pkgver.tar.gz::https://github.com/warmcat/libwebsockets/archive/v$pkgver.tar.gz")
sha512sums=('89ccc24b44e4f38f3b3918634dc5f2be78be1ea9fc1748064c8a54adae026c410bfc743caf9bbd304c312e34e624f5f8fb101d7b36052af9b94dbf309625ec0a')

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
