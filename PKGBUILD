# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034
pkgname=mn88472-firmware
pkgver=191226
pkgrel=1
pkgdesc="Firmware for Panasonic MN88472 DVB-T/T2/C demodulator"
arch=('any')
url="http://www.astrometa.com.tw/"
license=('unknown')
makedepends=('p7zip')
source=("$pkgname-$pkgver.exe::https://dl.dropbox.com/s/7eay10a9yy5qteb/AMDVBT2_Setup64_$pkgver.exe")
md5sums=('66fa0c07daaff3e821712b81c490cf65')

prepare() {
	7z x $pkgname-$pkgver.exe
	dd if=X64/AMDVBT2BDA.sys ibs=1 skip=220368 count=2005 of=$pkgname-$pkgver.fw
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 $pkgname-$pkgver.fw "$pkgdir"/usr/lib/firmware/dvb-demod-mn88472-02.fw
}
