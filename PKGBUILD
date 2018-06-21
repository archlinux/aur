# Maintainer: Tyler Johnson <mail@tyler-johnson.ca>
pkgname=fdic
pkgver=1.0.8
pkgrel=1
epoch=
pkgdesc="Dictionary filter for STDIN"
arch=('x86_64')
_reponame="dictionary-filter"
url="https://github.com/tejohnso/$_reponame"
license=('GPL')
groups=()
depends=('gcc-libs')
source=("https://github.com/tejohnso/dictionary-filter/archive/$pkgver.tar.gz")
md5sums=("SKIP")

build() {
	cd "$_reponame-$pkgver"
  g++ -O3 -std=c++17 -Wall -o fdic fdic.cpp dictionary.cpp
}

check() {
	cd "$_reponame-$pkgver"
  file -E fdic
}

package() {
	cd "$_reponame-$pkgver"
  install -D fdic "$pkgdir/usr/bin/fdic"
  sed -i "s/VERSION/$pkgver/g" fdic.1
  install -Dm644 fdic.1 "$pkgdir/usr/local/man/man1/fdic.1"
}
