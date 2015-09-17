# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=shards
pkgver=0.4.0
pkgrel=1
pkgdesc="The package manager for the Crystal language"
arch=('i686' 'x86_64')
url="https://github.com/ysbaddaden/shards"
license=('Apache')
depends=('libyaml' 'git' 'libpcl' 'libunwind' 'libevent' 'gc')
makedepends=('crystal')
source=("https://github.com/ysbaddaden/$pkgname/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"

  crystal build --release -o bin/shards src/shards.cr
}

check() {
  cd "$pkgname-$pkgver"
  ./bin/shards install
  make -j1 test
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 bin/shards "$pkgdir/usr/bin/shards"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('fff0f3c6562023fd279c80becf3683d2ac922ff097dda12f544f51f4b383ae5c')
