# Maintainer: Patrick Oppenlander <patrick.oppenlander at gmail.com>
#
# Note: to build this package you need to download S32_Power_Linux_v1.1.bin from
# http://www.nxp.com/products/microcontrollers-and-processors/arm-processors/s32-arm-processors-microcontrollers/s32-design-studio-ide:S32DS?code=S32DS&nodeId=0150522FC830D4&fpsp=1&tab=Design_Tools_Tab
# and place it in the same location as this PKGBUILD file.
#
pkgname=pegdbserver_power
pkgver=1.5.1.201701302216
pkgrel=1
pkgdesc="GDB server for Power devices using P&E JTAG hardware"
arch=('i386' 'x86_64')
license=('custom')
depends=('libusb-compat')
makedepends=('unzip')
install=pegdbserver_power.install
source=("http://www.pemicro.com/eclipse/updates/com.pemicro.debug.gdbjtag.ppc.updatesite/plugins/com.pemicro.debug.gdbjtag.ppc_$pkgver.jar" "license_gdb.pdf" "55-pemicro.rules")
sha256sums=('6a97336e50e0003400404d093a1cb2b393093c5a88117e3f9648ec696a756c64'
            '6b135ddd5388f6a0dd1d1d9d6c6d7321423f391914312c4a4aafd9d851d10dbc'
	    '4b9812f801faedb8a39c7e95bd829efeeb2941b1f4fb3ca774cfbf1ef4fa4081')
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

