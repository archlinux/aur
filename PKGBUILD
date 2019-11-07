# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=queryit
pkgver=0.1.0
pkgrel=1
pkgdesc="A very basic setupless terminal based SQL query"
arch=("x86_64")
url="https://github.com/hugopl/queryit"
license=("MIT")
depends=("termbox-git" "sqlite3>=3.30.1" "gc" "libevent" "pcre")
makedepends=("crystal>=0.31.1" "shards>=0.9.0")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/queryit/archive/v${pkgver}.tar.gz")
sha256sums=("914a9d1858ab8c1d6522efe016302c1f0508fa30ade7e64737a8929250ea2527")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  shards build --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  crystal spec
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 ./bin/queryit "${pkgdir}/usr/bin/queryit"
}
