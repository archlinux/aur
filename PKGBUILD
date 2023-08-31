# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jake McGinty <me@jakebot.org>
pkgname=hprt-n31-n41-drivers
pkgver=1.4.0
pkgrel=1
pkgdesc="CUPS files for HPRT N31 and N41 (as well as clones like the NefLaca NL-N41)"
arch=("x86_64")
url="https://www.hprt.com/hprt/files/product_down_file/model/121/classify/42.html"
license=('Unlicense')
depends=('libcups' 'glibc' 'zlib')
_realname="hprt_n31_n41_series_printer_linux_driver_v$pkgver"
source=("https://www.hprt.com/upload/files/$_realname.zip")
sha256sums=("af99de7e7fcfb348a164a7c46b0f72dbb9e369f2d0986824a3bbea433c96f9d4")

package() {
	cd "$_realname/$_realname"
	mkdir -p "$pkgdir/usr/lib/cups/filter"
	install -m 755 filter/x64/raster-tspl "$pkgdir/usr/lib/cups/filter"
	mkdir -p "$pkgdir/usr/share/cups/drv/hprt"
	install -m 644 ppd/*.ppd "$pkgdir/usr/share/cups/drv/hprt"

	mkdir -p "$pkgdir/usr/share/cups/model"
	cd "$pkgdir/usr/share/cups/model"
	ln -sT '../drv/hprt' 'hprt'
}
