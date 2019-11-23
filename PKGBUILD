# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=2.3.1
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('a704356dfba75d94a3db9ab30ccd4b5cea1ccd8866c20650026148f61e0d799760d04bb6fefec46b3ce93a4a575c81f0668064af498cf7b581edcb82d00eb22e'
            'd77793b7664d2127f2d5519a67dc9715bb3771ffd7d4139a23bfcb73bf9ce08b2919e9447bfa91771bf3af0d45fcc010ad764958b950d0dd97ba7b0e97c39395')
sha256sums=('ecd66a326f348ce4e109df4ed06d9fe03a6fa5f22a6fe14aa577a393d2b08a32'
            'd0e6ba03322774d218af697285aca806233e59ad06aea1a651cf60c14ee4cfea')
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="-flto -O3 $CFLAGS"

build() {
	cd "bc-$pkgver"
	PREFIX=/usr ./configure.sh -GP
	make
}

check() {
	cd "bc-$pkgver"
	make check
}

package() {
	cd "bc-$pkgver"
	DESTDIR="$pkgdir/" make install
}
