# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.1.0
pkgrel=1
source=(
	"https://github.com/arekinath/pivy/archive/v0.1.0.tar.gz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.7.4.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
makedepends=()
md5sums=('3eed4156a6161f9448e95c07cb8111d4'
         '94ce8f4cdbb6b57565da61e380d63045')

prepare() {
	mv "libressl-2.7.4" "$pkgname-$pkgver/libressl"
}

build() {
	cd "$pkgname-$pkgver"
	cd libressl
	./configure --enable-static
	cd crypto
	make
	cd ../..
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
