# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=queryit
pkgver=0.8.3
pkgrel=1
pkgdesc="A very basic setupless terminal based SQL query runner"
arch=("x86_64")
url="https://github.com/hugopl/queryit"
license=("MIT")
depends=("sqlite>=3.30.1" "gc" "libevent" "pcre" "libyaml>=0.2.0" "openssl>=1.1.1")
makedepends=("crystal>=0.35.0" "shards>=0.11.1" "make" "python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/queryit/archive/v${pkgver}.tar.gz")
sha256sums=('c0db0997cea0728d52d13ab6ea7a2e3a295f17ed50ecee5dbeb34a16b98106ca')

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
