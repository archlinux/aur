# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034
pkgname=mn88472-firmware
pkgver=170427
pkgrel=1
pkgdesc="Firmware for Panasonic MN88472 DVB-T/T2/C demodulator"
arch=('any')
url="http://www.astrometa.com.tw/"
license=('unknown')
makedepends=('p7zip')
source=("https://dl.dropbox.com/s/ffckhetzp3vmjio/AMDVBT2_Setup_$pkgver.exe")
md5sums=('da86f51a047df8acfd8d744834a09fcd')

prepare() {
	7z x AMDVBT2_Setup_$pkgver.exe
}

build() {
	dd if=X64/AMDVBT2BDA.sys ibs=1 skip=220368 count=2005 of=dvb-demod-mn88472-02.fw
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/firmware dvb-demod-mn88472-02.fw
}
