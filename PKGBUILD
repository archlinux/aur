# Maintainer: Luken <luken[at]luken-tech[dot]pl>

pkgname=brother-hll2340dw
pkgver=3.2.0_1
pkgrel=1
_brotherpkgver=${pkgver:0:$((${#pkgver}-2))}
_brotherrelease=${pkgver:$((${#pkgver}-1))}
_brotherdrivername=HLL2340D
pkgdesc="LPR and CUPS driver for HLL2340D model."
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en'
license=('GPL')
depends=('cups' 'ghostscript')

source=("http://download.brother.com/welcome/dlf101910/hll2340dlpr-${_brotherpkgver}-${_brotherrelease}.i386.rpm"
        "http://download.brother.com/welcome/dlf101911/hll2340dcupswrapper-${_brotherpkgver}-${_brotherrelease}.i386.rpm"
        "brother_lpdwrapper_${_brotherdrivername}.patch")

md5sums=('90ab2e6b0708ad8b23f6911245f9a50f'
         '3c1c19e4ffbfa2adb42e5eea3776e376'
         '7e39bbda84f84aeb68f9b33195b90217') 

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
