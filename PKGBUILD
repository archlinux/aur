# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=queryit
pkgver=0.7.0
pkgrel=1
pkgdesc="A very basic setupless terminal based SQL query"
arch=("x86_64")
url="https://github.com/hugopl/queryit"
license=("MIT")
depends=("termbox-git" "sqlite>=3.30.1" "gc" "libevent" "pcre" "libyaml>=0.2.0" "openssl>=1.1.1")
makedepends=("crystal>=0.32.1" "shards>=0.9.0" "make")
source=("$pkgname-$pkgver.tar.gz::https://github.com/hugopl/queryit/archive/v${pkgver}.tar.gz")
sha256sums=('3f59d0b6483bbd5301c70c5cc55d8a87073ac26f444a75c5605c92c31e06cf9e')

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
