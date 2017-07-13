# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=ofono-phonepi
pkgver=1.19
pkgrel=3
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications. Fork for PhonePi"
url="https://01.org/ofono"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git")
depends=("bluez" "dbus" "modemmanager" "glib2" "udev" "mobile-broadband-provider-info")
source=('git+https://gitlab.com/PhonePi/ofono')
sha256sums=("SKIP")

build() {
	cd "$srcdir/ofono"
	./bootstrap-configure
	make CFLAGS="$CFLAGS -Wimplicit-fallthrough=0"
}

package() {
	cd "$srcdir/ofono"
	make DESTDIR="$pkgdir" install
	install -Dm755 "./src/ofono.conf" "$pkgdir/etc/dbus-1/system.d/ofono.conf"
	install -Dm755 "./src/ofono.service" "$pkgdir/usr/lib/systemd/system/ofono.service"
	install -Dm755 "./src/ofono.rules" "$pkgdir/etc/udev/rules.d/ofono.rules"
}
