# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=redi-search
pkgver=1.6.12
pkgrel=2
pkgdesc="Redis module that implements a search engine on top of Redis."
arch=("x86_64")
url="https://github.com/RediSearch/RediSearch"
license=("Custom")
depends=("redis")
makedepends=("git" "cmake")
source=("$pkgname-$pkgver::git+$url")
md5sums=("SKIP")

prepare() {
  cd "$pkgname-$pkgver"
  git checkout tags/v$pkgver
  git submodule update --init
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -D src/redisearch.so $pkgdir/usr/lib/redis/redisearch.so
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/redisearch/LICENSE
}
