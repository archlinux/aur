# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=redi-search
pkgver=1.6.12
pkgrel=1
pkgdesc="Redis module that implements a search engine on top of Redis."
arch=("x86_64")
url="https://github.com/RediSearch/RediSearch"
license=("Custom")
depends=("redis")
makedepends=("git" "cmake")
source=("$pkgname::git+$url")
md5sums=("SKIP")

prepare() {
  cd "$pkgname"
  git checkout tags/v$pkgver
  git submodule update --init
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -D src/redisearch.so $pkgdir/usr/lib/redis/redisearch.so
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/redisearch/LICENSE
}
