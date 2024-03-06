# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Jordan Selanders <jordan.selanders@firstoncolour.com>

pkgname="brother-hll6200dw"
pkgver="3.5.1"
_pkgver=${pkgver}-1
pkgrel=1
pkgdesc="Brother HL-L6200DW CUPS driver"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hll6200dw_us_as"
license=('custom:proprietary')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=("https://download.brother.com/welcome/dlf102426/hll6200dwlpr-${_pkgver}.i386.rpm"
		"https://download.brother.com/welcome/dlf102427/hll6200dwcupswrapper-${_pkgver}.i386.rpm"
		"brother-hll6200dw.patch")
md5sums=('57b1247713c5cbafe352dbfbc61fd0ae'
         'd3fb2f589f0a1c7e1e20fb74e4a027f7'
         '0d7f161bb79cea09ae18c5d9cbceaa4f')

prepare() {
	patch opt/brother/Printers/HLL6200DW/cupswrapper/lpdwrapper brother-hll6200dw.patch
}

package() {
	cp -a "$srcdir/var" "$pkgdir"

	install -Dm644 \
		"$srcdir/opt/brother/Printers/HLL6200DW/cupswrapper/brother-HLL6200DW-cups-en.ppd" \
		"$pkgdir/usr/share/cups/model/brother-HLL6200DW-cups-en.ppd"

	install -Dm755 \
		"$srcdir/opt/brother/Printers/HLL6200DW/cupswrapper/lpdwrapper" \
		"$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL6200DW"

	install -Dm755 \
		"$srcdir/opt/brother/Printers/HLL6200DW/cupswrapper/paperconfigml2" \
		"$pkgdir/usr/share/Brother/Printers/HLL6200DW/cupswrapper/paperconfigml2"

	install -Dm644 \
		"$srcdir/opt/brother/Printers/HLL6200DW/inf/brHLL6200DWfunc" \
		"$pkgdir/usr/share/Brother/Printer/HLL6200DW/inf/brHLL6200DWfunc"

	install -Dm644 \
		"$srcdir/opt/brother/Printers/HLL6200DW/inf/brHLL6200DWrc" \
		"$pkgdir/usr/share/Brother/Printer/HLL6200DW/inf/brHLL6200DWrc"

	install -Dm755 \
		"$srcdir/opt/brother/Printers/HLL6200DW/inf/setupPrintcap" \
		"$pkgdir/usr/share/Brother/Printer/HLL6200DW/inf/setupPrintcap"

	install -Dm755 \
		"$srcdir/opt/brother/Printers/HLL6200DW/lpd/${arch}/brprintconflsr3" \
		"$pkgdir/usr/share/Brother/Printer/HLL6200DW/lpd/${arch}/brprintconflsr3"

	install -Dm755 \
		"$srcdir/opt/brother/Printers/HLL6200DW/lpd/${arch}/rawtobr3" \
		"$pkgdir/usr/share/Brother/Printer/HLL6200DW/lpd/${arch}/rawtobr3"
}
