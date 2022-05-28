# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yamada Hayao <development@fascode.net>

pkgname=checkmedia
pkgdesc="Check installation CDs and DVDs for errors."
pkgver=6.1
pkgrel=1
arch=('x86_64')
url="https://github.com/openSUSE/checkmedia"
license=('GPL3')
depends=('perl')
provides=('libmediacheck.so=6-64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'Makefile.patch')
sha256sums=('1cbfd7b4f5b898ec64c4435609b2bcffeaed35294bd85fb57f92dd2f0089babe'
            'dc949a243128c3265f86517b6c3356a3e66bd31695f5cdcc12501e3109fa66fa')

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
