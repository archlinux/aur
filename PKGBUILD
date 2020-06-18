# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=queryit
pkgver=0.8.2
pkgrel=1
pkgdesc="A very basic setupless terminal based SQL query runner"
arch=("x86_64")
url="https://github.com/hugopl/queryit"
license=("MIT")
depends=("sqlite>=3.30.1" "gc" "libevent" "pcre" "libyaml>=0.2.0" "openssl>=1.1.1")
makedepends=("crystal>=0.35.0" "shards>=0.10.0" "make" "python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/queryit/archive/v${pkgver}.tar.gz")
sha256sums=('1e6cf14518269815c0471994b3ac5523ba9eff33a0c8b8282de54b9d1b998ff2')

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
