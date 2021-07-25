# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=mn88472-firmware
pkgver=200917
pkgrel=1
pkgdesc='Firmware for Panasonic MN88472 DVB-T/T2/C demodulator'
arch=('any')
url='http://www.astrometa.com.tw/'
license=('unknown')
makedepends=('p7zip')
source=('https://dl.dropbox.com/s/nggcmw3uewduchp/AMDVBT2_Setup_200917.exe')
b2sums=('632548b4a7feae81379aa5b6db925b368b24eea65bf4190c4beac2ee6f004c85245db9d875936d292cdbebce5fec4c42d12ac443b029a8bdea261ecc8b8c9565')

prepare() {
	7z x AMDVBT2_Setup_$pkgver.exe
	dd if=X64/AMDVBT2BDA.sys ibs=1 skip=220368 count=2005 of=dvb-demod-mn88472-02.fw
}

check() {
	# https://palosaari.fi/linux/v4l-dvb/firmware/MN88472/02/README
	md5sum -c <<< '088b891ac9273ff8c6818fca27b24d81 dvb-demod-mn88472-02.fw'
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/firmware dvb-demod-mn88472-02.fw
}
