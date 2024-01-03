# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yamada Hayao <development@fascode.net>

pkgname=checkmedia
pkgdesc="Check installation CDs and DVDs for errors."
pkgver=6.2
pkgrel=1
arch=('x86_64')
url="https://github.com/openSUSE/checkmedia"
license=('GPL3')
depends=('perl')
provides=('libmediacheck.so=6-64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'Makefile.patch')
sha256sums=('2bf0edbd3ec72543d11d9be325f8b05e554020c0257f250165abdb204687eb4c'
            'dca21889df9c1e618aeabf99fd51a5602ad0547576bb29e418f38c33579875f0')

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
