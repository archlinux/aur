# Maintainer: Tommy Jerry Mairo <tjm@member.fsf.org>
pkgname=hprt-mt800-drivers
pkgver=1.2.1
pkgrel=5
pkgdesc="CUPs filter and ppd files for HPRT MT800 serises"
arch=("x86_64")
url="https://www.hprt.com/mt800/drivers.html"
license=('Unlicense')
depends=("cups")
_realname="hprt_mt800_printer_linux_driver_v$pkgver"
source=("https://www.hprt.com/upload/files/$_realname.zip")
sha256sums=("078ef53879070e5d3ae44853f502ec3b357252c9ff826aa62f416e07d7cd26ee")

package() {
	cd "$_realname/$_realname"
	mkdir -p "$pkgdir/usr/lib/cups/filter"
	install -m 755 filter/x64/raster-esc "$pkgdir/usr/lib/cups/filter"
	mkdir -p "$pkgdir/usr/share/cups/drv/hprt"
	install -m 644 ppd/*.ppd "$pkgdir/usr/share/cups/drv/hprt"

	mkdir -p "$pkgdir/usr/share/cups/model"
	cd "$pkgdir/usr/share/cups/model"
	ln -sT '../drv/hprt' 'hprt'
}
