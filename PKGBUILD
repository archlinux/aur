# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Jingbei Li <i@jingbei.li>

_pkgname=libwebsockets
pkgname=libwebsockets-static
pkgver=2.3.0
pkgrel=1
pkgdesc='C library for lightweight websocket clients and servers (static library)'
arch=('i686' 'x86_64')
url=https://libwebsockets.org
license=('LGPL')
depends=('libpcap' 'openssl' 'zlib')
makedepends=('cmake')
source=("https://github.com/warmcat/libwebsockets/archive/v$pkgver.tar.gz")
sha512sums=('28e11c49283fcfc0673e1f59e5fc523784fa953d71fbfc8afb40fe4a7041dc5fbc689a97c95eff5a1397a67d28b698245e49444413c83e637893767372c06e61')

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
