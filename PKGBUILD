# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=queryit
pkgver=0.8.5
pkgrel=1
pkgdesc="A very basic setupless terminal based SQL query runner"
arch=("x86_64")
url="https://github.com/hugopl/queryit"
license=("MIT")
depends=("sqlite>=3.30.1" "gc" "libevent" "pcre" "libyaml>=0.2.0" "openssl>=1.1.1")
makedepends=("crystal>=0.35.0" "shards>=0.11.1" "make" "python")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/queryit/archive/v${pkgver}.tar.gz")
sha256sums=('25763f1947679b828b8793b0d83f7315bc4b1c18de2c2ed7f099b647dad357fb')

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
