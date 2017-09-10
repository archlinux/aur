# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=codemeter-runtime
pkgver=6.50.2631.502
pkgrel=1
pkgdesc='codemeter runtime (server and cli tools, no GUI)'
license=('custom')
url='http://www.codemeter.de/'

arch=(x86_64)
backup=('etc/wibu/CodeMeter/Server.ini')
install="$pkgname.install"

depends=(
	'libusb'
	'fakeroot'
)

source=(
	"https://www.codemeter.de/downloads/files/cm6_50b/lin/codemeter-lite_6.50.2631.502_amd64.deb"
	"codemeter.service"
	"sysusers.conf"
)

sha512sums=(
	'bb145aea78a09fa26e504735020d4690e1a72bca227abb9e5abcfe9c001eab7f510286bfbfcb99ba6224fcabf54944f6473baf446d3d0709123ccb52ccf2f6b8'
	'e3a063eb80566f1c27ac00a57dc15a8474c6429903065504b3fe124f4037a4169c4e6a4c8f999b336d892e745aa6383919ebe6cf5d88e2278dc30a2026938d42'
	'0acee8febd3f5763ee493c42fbd1a435b1c2572e9cab68c9da81f858dd6c7d4d5aad88deffd5b454b95f0e7492faf786f779c4c883b20ff8ea4e7006f2c3a46b'
)

prepare() {
	bsdtar -xf data.tar.*
}

package() {
	install -d "$pkgdir/etc"
	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/lib"
	install -d "$pkgdir/usr/lib32"
	install -d "$pkgdir/usr/share"
	install -d "$pkgdir/var/lib"
	install -d "$pkgdir/var/log"

	# Created by CodeMeterLin -x on debian.
	install -d "$pkgdir/var/spool/tmp"

	cp -a "$srcdir/etc/wibu"                   "$pkgdir/etc/"
	cp -a "$srcdir/usr/bin/"*                  "$pkgdir/usr/bin/"
	cp -a "$srcdir/usr/sbin/"*                 "$pkgdir/usr/bin/"
	cp -a "$srcdir/usr/lib/x86_64-linux-gnu/"* "$pkgdir/usr/lib/"
	cp -a "$srcdir/usr/lib/i386-linux-gnu/"*   "$pkgdir/usr/lib32/"
	cp -a "$srcdir/usr/share/"*                "$pkgdir/usr/share/"
	cp -a "$srcdir/var/lib/CodeMeter"          "$pkgdir/var/lib/"
	cp -a "$srcdir/var/log/CodeMeter"          "$pkgdir/var/log/"

	ln -fs '/usr/share/licenses/common/LGPL2.1/license.txt' "$pkgdir/usr/share/doc/CodeMeter/lgpl-2.1.txt"

	install -D "$srcdir/sysusers.conf"     "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -D "$srcdir/codemeter.service" "$pkgdir/usr/lib/systemd/system/codemeter.service"

}
