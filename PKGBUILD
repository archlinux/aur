# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Librewish <librewish@gmail.com>
pkgname=ofono
pkgver=2.14
pkgrel=1
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://01.org/ofono"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("GPL2")
depends=("bluez" "dbus" "glib2" "udev" "mobile-broadband-provider-info" "ell")
optdepends=("phonesim" "mmsd" "upower")
source=(
	"https://www.kernel.org/pub/linux/network/ofono/$pkgname-$pkgver.tar.xz"
#	"https://www.kernel.org/pub/linux/network/ofono/$pkgname-$pkgver.tar.sign"
)
sha256sums=('983cbfd5e1e1a410ba7ad2db7f50fadc91e50b29f1ede40cdc73f941da7ba95f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--enable-external-ell \
		--enable-test \
		--enable-tools \
		--enable-dundee
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
