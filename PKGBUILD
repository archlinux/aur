# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.1.6
pkgrel=1
pkgdesc="Tools for using PIV smartcards/Yubikeys with ssh-agent and disk encryption"
url="https://github.com/arekinath/pivy"
license=('MPL2')
source=(
	"https://github.com/arekinath/pivy/archive/v$pkgver.tar.gz"
	"https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.7.4.tar.gz")
arch=(x86 x86_64)
depends=(libbsd pcsclite libedit)
makedepends=()
sha256sums=('8f426fab331534ea96f3b4eef3df5ce963c2a4de6906160943066b33698d2046'
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
