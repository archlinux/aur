# Maintainer: David Pfefferlé <pfefferle dot david at gmail dot com>

pkgname=brother-hll2865dw
pkgver=4.1.0_1
pkgrel=1
_brotherpkgver=${pkgver:0:$((${#pkgver}-2))}
_brotherrelease=${pkgver:$((${#pkgver}-1))}
_brotherdrivername=HLL2865DW
pkgdesc="CUPS driver for HL-L2865DW model."
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en'
license=('custom:Brother')
depends=('glibc' 'bash' 'perl')
optdepends=('cups: printing support'
	    'ghostscript')
source=("http://download.brother.com/welcome/dlf105975/hll2865dwpdrv-${_brotherpkgver}-${_brotherrelease}.i386.rpm")
sha256sums=('ec65b51818650c8b8436424319d3ede7b6fca4307f26c63e24d7248e332914b8')
package() {
cp -a "$srcdir/var" "$pkgdir"

install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother-${_brotherdrivername}-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-${_brotherdrivername}-cups-en.ppd"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_brotherdrivername}"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/paperconfigml2" "$pkgdir/usr/share/Brother/Printers/$_brotherdrivername/cupswrapper/paperconfigml2"

install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}func" "$pkgdir/usr/share/Brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}func"
install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}rc" "$pkgdir/usr/share/Brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}rc"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/setupPrintcap" "$pkgdir/usr/share/Brother/Printers/${_brotherdrivername}/inf/setupPrintcap"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/Brother/Printers/${_brotherdrivername}/lpd/brprintconflsr3"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/Brother/Printers/${_brotherdrivername}/lpd/rawtobr3"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/lpdfilter" "$pkgdir/usr/share/Brother/Printers/${_brotherdrivername}/lpd/filter_${_brotherdrivername}"

#symlink in case it needs it in the lpd subdir
ln -s "/usr/share/Brother/Printers/${_brotherdrivername}/inf" "$pkgdir/usr/share/Brother/Printers/${_brotherdrivername}/lpd/inf"

## copy licenses
install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
}

