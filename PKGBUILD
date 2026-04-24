# Maintainer: Denys Sedchenko <aur@x1unix.dev>
pkgname=redis-cli
_realname=redis-cli
pkgver=8.6.2
pkgrel=2
pkgdesc="Redis command-line interface client built from Redis sources"
arch=('x86_64' 'aarch64')
url="https://github.com/redis/redis"
license=('BSD-3-Clause')
provides=("${_realname}")
depends=('glibc' 'openssl')
makedepends=('git' 'openssl')
source=("git+https://github.com/redis/redis.git#tag=${pkgver}")
sha256sums=('SKIP')
options=('!debug')

build() {
  make -C "${srcdir}/redis" redis-cli BUILD_TLS=yes
}

package() {
  install -Dm755 "${srcdir}/redis/src/redis-cli" "${pkgdir}/usr/bin/redis-cli"
  install -Dm644 "${srcdir}/redis/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
