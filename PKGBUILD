# Maintainer: Alex Wilson <alex at cooperi dot net>
pkgname=pivy
pkgver=0.1.5
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
sha256sums=('a12eaf9dedc9f6a2fc1ac0a9404a0a40182cb6f85276530ccd23ba70f9325b4b'
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
