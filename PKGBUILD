pkgname=speedtouch-firmware
pkgver=3.0.1.2
pkgrel=2
pkgdesc='Firmware for Thomson SpeedTouch modems'
arch=(any)
makedepends=(tcc)
license=(custom)
source=(
	'http://www.linux-usb.org/SpeedTouch/firmware/firmware-extractor.tar.gz'
	'https://web.archive.org/web/20061203044952id_/http://www.speedtouch.com/download/drivers/USB/SpeedTouch330_firmware_3012.zip'
	'https://web.archive.org/web/20070306191113id_/http://www.speedtouch.com/driver_upgrade_lx_3.0.1.2.htm'

	# 'https://web.archive.org/web/20070310222023id_/http://download.ethomson.com/download/speedmgmt.tar.gz'
	# older version (extract from mgmt.o)
)
sha512sums=(
	'2d2e55f46961dfe20218a17a6fe897fc35f7cd2802dc6f61ff3124b8ff51a2d8f5275c683b2f2676e72451b220d2f705550ab5d73923de284fa591fec8796efa'
	'd4ec1b609eb58b15b0c569fc2c96e453517f6a8141c706f342549093c2c7bbdc09bbc3f05ecf75f3018e54f03a974b84e625fb9401f02d4f4143b721eee0b3c3'
	'65ef3be03fafcb96ac3f23c51684be870ac03a8469234ba73e2c2edcf872b1d994dca8ef6297255e370046061805347919bea98799ec73d3273089d6d76c1db5'
	# '8d77ef0e45ee455dd67efecf4fcd95e4b00e54b016e3323b96ed9e60f76b6330fdecf06b6c54a1b2a3938badf158d79e886092d9c8a908984b0cb5a2e880d7aa'
)

build() {
	cd "$srcdir/firmware-extractor"
	tcc firmware.c -o firmware-extractor

	./firmware-extractor ../"ZZZL_3.012"
	mv speedtch-1.bin ../speedtch-1.bin.4 # .00
	mv speedtch-2.bin ../speedtch-2.bin.4 # .00
	./firmware-extractor ../"KQD6_3.012"
	mv speedtch-1.bin ../speedtch-1.bin.2
	mv speedtch-2.bin ../speedtch-2.bin.2
}

package() {
	install -dm0755 "$pkgdir/usr/lib/firmware"
	install -Dm0644 -t "$pkgdir/usr/lib/firmware" \
		"$srcdir"/speedtch-?.bin*
	install -Dm0644 "$srcdir/driver_upgrade_lx_3.0.1.2.htm" \
		"$pkgdir/usr/share/licenses/$pkgname/license.html"
}
