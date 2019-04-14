# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.1.1
pkgrel=1
pkgdesc="Tools for using PIV smartcards/Yubikeys with ssh-agent and encryption"
url="https://github.com/arekinath/pivy"
license=('MPL2')
source=(
	"https://github.com/arekinath/pivy/archive/v$pkgver.tar.gz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.7.4.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
makedepends=()
sha256sums=('3b625a4907243461a56a13a2b4930b960b80b153e442f14836d83d4aa665008b'
            '1e3a9fada06c1c060011470ad0ff960de28f9a0515277d7336f7e09362517da6')

prepare() {
	mv "libressl-2.7.4" "$pkgname-$pkgver/libressl"
}

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
