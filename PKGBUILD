# Maintainer: Raihan Ahamed <raihan1999ahamed@gmail.com>

pkgname=unudhcpd
pkgver=0.2.1
pkgrel=1
pkgdesc="Extremely basic DHCP server that only issues 1 IP address to any client"
url="https://gitlab.com/postmarketOS/unudhcpd"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('meson')
source=("https://gitlab.com/postmarketOS/unudhcpd/-/archive/$pkgver/unudhcpd-$pkgver.tar.gz")
sha256sums=('c404424a65e6341ef04300e7408a2edad1481ce8841f541e20e058800e7b5485')

build() {
	cd $pkgname-$pkgver
	arch-meson output
	meson compile -C output
}

check() {
	cd $pkgname-$pkgver
	meson test --no-rebuild --print-errorlogs -C output
}

package() {
	cd $pkgname-$pkgver
	DESTDIR="$pkgdir" meson install --no-rebuild -C output
}
