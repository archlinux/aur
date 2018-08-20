# Maintainer: Nathaniel <njag2202@gmail.com>

pkgname=brother-hll2305w
pkgver=3.2.0_1
pkgrel=1
_brotherpkgver=${pkgver:0:$((${#pkgver}-2))}
_brotherrelease=${pkgver:$((${#pkgver}-1))}
_brotherdrivername=HLL2305
pkgdesc="LPR and CUPS driver for HLL2305 model."
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en'
license=('GPL')
depends=('cups' 'ghostscript')

source=("http://download.brother.com/welcome/dlf101902/hll2305lpr-${_brotherpkgver}-${_brotherrelease}.i386.rpm"
        "http://download.brother.com/welcome/dlf101903/hll2305cupswrapper-${_brotherpkgver}-${_brotherrelease}.i386.rpm"
        "brother_lpdwrapper_${_brotherdrivername}.patch")

md5sums=('9a62315bab0d4e3e92637cfd8432ba73'
         '1f86aab2fc7c243723d40ff9c40ec081'
         'dc776a2b7cc4be618624a1bba896ccca') 

if [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-glibc')
fi

prepare() {

patch "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}" < "$srcdir/brother_lpdwrapper_${_brotherdrivername}.patch"

}

package() {

cp -a "$srcdir/var" "$pkgdir"

install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother-${_brotherdrivername}-cups-en.ppd" "$pkgdir/usr/share/cups/model/brother-${_brotherdrivername}-cups-en.ppd"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/brother_lpdwrapper_${_brotherdrivername}" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_brotherdrivername}"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/cupswrapper/paperconfigml1" "$pkgdir/usr/share/Brother/Printer/$_brotherdrivername/cupswrapper/paperconfigml1"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/braddprinter" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/braddprinter"
install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}func" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/br${_brotherdrivername}func"
install -Dm644 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/br${_brotherdrivername}rc" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/br${_brotherdrivername}rc"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/inf/setupPrintcap" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/inf/setupPrintcap"

install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/brprintconflsr3" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/lpd/brprintconflsr3"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/filter_${_brotherdrivername}" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/lpd/filter_${_brotherdrivername}"
install -Dm755 "$srcdir/opt/brother/Printers/${_brotherdrivername}/lpd/rawtobr3" "$pkgdir/usr/share/Brother/Printer/${_brotherdrivername}/lpd/rawtobr3"

}
