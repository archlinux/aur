# Maintainer: Tyler Johnson <mail@tyler-johnson.ca>
pkgname=flen
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Word length filter for STDIN"
arch=('x86_64')
_reponame="length-filter"
url="https://github.com/tejohnso/$_reponame"
license=('GPL')
groups=()
depends=('gcc-libs')
source=("https://github.com/tejohnso/length-filter/archive/$pkgver.tar.gz")
md5sums=("SKIP")

build() {
	cd "$_reponame-$pkgver"
  g++ -O3 -std=c++17 -Wall -o flen flen.cpp
}

check() {
	cd "$_reponame-$pkgver"
  file -E flen
}

package() {
	cd "$_reponame-$pkgver"
  install -D flen "$pkgdir/usr/bin/flen"
  sed -i "s/VERSION/$pkgver/g" flen.1
  install -Dm644 flen.1 "$pkgdir/usr/local/man/man1/flen.1"
}
