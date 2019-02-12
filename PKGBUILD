#
# Maintainer: Patrick Oppenlander <patrick.oppenlander at gmail.com>
#
pkgname=pegdbserver_power
pkgver=1.8.3.201812312131
pkgrel=1
pkgdesc="GDB server for Power devices using P&E JTAG hardware"
arch=(x86_64)
license=(custom)
depends=(libusb-compat)
makedepends=(unzip)
install=pegdbserver_power.install
source=("http://www.pemicro.com/eclipse/updates/com.pemicro.debug.gdbjtag.ppc.updatesite/plugins/com.pemicro.debug.gdbjtag.ppc_$pkgver.jar" "license_gdb.pdf" "55-pemicro.rules")
sha256sums=(737eadaf60130f6fd6b2ee220e7e61bad619c389aa6d95b8a363497e8736b55c
            6b135ddd5388f6a0dd1d1d9d6c6d7321423f391914312c4a4aafd9d851d10dbc
            4b9812f801faedb8a39c7e95bd829efeeb2941b1f4fb3ca774cfbf1ef4fa4081)
options=('!strip')

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -r lin/* "$pkgdir/opt/$pkgname"
	chmod +x "$pkgdir/opt/$pkgname/pegdbserver_power_console"
	chmod 644 "$pkgdir/opt/$pkgname/gdi/P&E"/*
	chmod 666 "$pkgdir/opt/$pkgname/gdi/P&E"/*.add

	mkdir -p "$pkgdir/etc/udev/rules.d"
	cp 55-pemicro.rules "$pkgdir/etc/udev/rules.d"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/$pkgname/pegdbserver_power_console "$pkgdir/usr/bin/pegdbserver_power_console"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp license_gdb.pdf "$pkgdir/usr/share/licenses/$pkgname"
}

