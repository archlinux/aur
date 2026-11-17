# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Yamada Hayao <development@fascode.net>

pkgname=checkmedia
pkgdesc="Check installation CDs and DVDs for errors."
pkgver=7.1
pkgrel=1
arch=('x86_64')
url="https://github.com/openSUSE/checkmedia"
license=('GPL3')
depends=('openssl' 'perl')
provides=('libmediacheck.so=7-64')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'Makefile.patch')
sha256sums=('3046838f1069a5e67a15bf1b95bd2d60c0de515162376b36549bf975305461c9'
            'f784b139a911094f83f243334653974b9e954402edd61c62574a4d3d2eea458c')

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
