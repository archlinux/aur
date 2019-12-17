# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=queryit
pkgver=0.4.0
pkgrel=1
pkgdesc="A very basic setupless terminal based SQL query"
arch=("x86_64")
url="https://github.com/hugopl/queryit"
license=("MIT")
depends=("termbox-git" "sqlite3>=3.30.1" "gc" "libevent" "pcre")
makedepends=("crystal>=0.31.1" "shards>=0.9.0" "libyaml>=0.2.0" "make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/queryit/archive/v${pkgver}.tar.gz")
sha256sums=('7b9e00f6ec6dc670b0e543cac4005e40e634ab3a3762bfa3f27cbb2d8befa0bd')

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
  make install DESTDIR="${pkgdir}"
}
