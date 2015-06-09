# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=ofono
pkgver=1.16
pkgrel=1
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://01.org/ofono"
arch=("i686" "x86_64")
license=("GPL2")
depends=("bluez" "dbus-core" "modemmanager" "glib2" "udev" "mobile-broadband-provider-info")
source=("https://www.kernel.org/pub/linux/network/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=("403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07")


build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm755 "$srcdir/$pkgname-$pkgver/src/ofono.conf" "$pkgdir/etc/dbus-1/system.d/ofono.conf"
	install -Dm755 "$srcdir/$pkgname-$pkgver/src/ofono.service" "$pkgdir/usr/lib/systemd/system/ofono.service"
}
