# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=queryit
pkgver=0.8.0
pkgrel=2
pkgdesc="A very basic setupless terminal based SQL query runner"
arch=("x86_64")
url="https://github.com/hugopl/queryit"
license=("MIT")
depends=("sqlite>=3.30.1" "gc" "libevent" "pcre" "libyaml>=0.2.0" "openssl>=1.1.1")
makedepends=("crystal>=0.34.0" "shards>=0.9.0" "make" "python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/queryit/archive/v${pkgver}.tar.gz")
sha256sums=('0bb65213ccc9107fa6e882442a080d503f5c1e298d5e35828471128ef2fac4da')

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
