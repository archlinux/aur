# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yamada Hayao <development@fascode.net>

pkgname=checkmedia
pkgdesc="Check installation CDs and DVDs for errors."
pkgver=6.3
pkgrel=2
arch=('x86_64')
url="https://github.com/openSUSE/checkmedia"
license=('GPL3')
depends=('perl')
makedepends=('git')
provides=('libmediacheck.so=6-64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'Makefile.patch')
sha256sums=('1938bc8604c6abcf807b2365e0b9169d38845ad2c83db6e2bebfa8b0bbec9ae9'
            '6980ac42a685594944ec41d12ab3c26177e6e9557fdc2e75a6aab15780f0d2c3')

prepare(){
	patch -p1 -d "$pkgname-$pkgver" < Makefile.patch
}

build(){
	cd "$pkgname-$pkgver"
	make checkmedia VERSION="$pkgver" MAJOR_VERSION="${pkgver::1}" ARCH="$CARCH"
}

check() {
	cd "$pkgname-$pkgver"
	make test VERSION="$pkgver" MAJOR_VERSION="${pkgver::1}" ARCH="$CARCH"
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" VERSION="$pkgver" MAJOR_VERSION="${pkgver::1}" ARCH="$CARCH" install
}
