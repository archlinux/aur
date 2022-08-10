# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Librewish <librewish@gmail.com>
pkgname=ofono
pkgver=1.34
pkgrel=1
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://01.org/ofono"
arch=("i686" "x86_64" "armv6h" "armv7h" "aarch64")
license=("GPL2")
depends=("bluez" "dbus" "glib2" "udev" "mobile-broadband-provider-info")
optdepends=("phonesim" "mmsd" "upower")
source=(
	"https://www.kernel.org/pub/linux/network/ofono/$pkgname-$pkgver.tar.xz"
#	"https://www.kernel.org/pub/linux/network/ofono/$pkgname-$pkgver.tar.sign"
)
sha256sums=("c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7")

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man \
		--enable-test \
		--enable-tools \
		--enable-dundee
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 "$srcdir/$pkgname-$pkgver/src/ofono.conf" "$pkgdir/etc/dbus-1/system.d/ofono.conf"
	install -Dm644 "$srcdir/$pkgname-$pkgver/src/ofono.service" "$pkgdir/usr/lib/systemd/system/ofono.service"
}
