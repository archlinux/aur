# Maintainer: Mio Iwakura <mio dot iwakura at gmail dot com>
pkgname="brother-hll6250dw"
pkgver="3.2.0_1"
pkgrel=1
pkgdesc="Brother HL-L6250DW CUPS driver"
arch=('i686' 'x86_64')
url="http://brother.com"
license=('GPL')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=("http://download.brother.com/welcome/dlf102567/hll6250dwlpr-3.2.0-1.i386.rpm"
        "http://download.brother.com/welcome/dlf102568/hll6250dwcupswrapper-3.2.0-1.i386.rpm"
        "brother-hll6250dw.patch")
md5sums=('788c03fb11fb3871da9c28a1f81ea463'
         '6fab8de580fccacdfdaf79737cb4ac23'
         '04ee653caa5ff653342de33f82147256')

prepare() {
    patch -p1 < brother-hll6250dw.patch
}

package() {
    cp -a "$srcdir/var" "$pkgdir"

    install -Dm644 \
        "$srcdir/opt/brother/Printers/HLL6250DW/cupswrapper/brother-HLL6250DW-cups-en.ppd" \
        "$pkgdir/usr/share/cups/model/brother-HLL6250DW-cups-en.ppd"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/HLL6250DW/cupswrapper/brother_lpdwrapper_HLL6250DW" \
        "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_HLL6250DW"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/HLL6250DW/cupswrapper/paperconfigml1" \
        "$pkgdir/usr/share/Brother/Printer/HLL6250DW/cupswrapper/paperconfigml1"

    install -Dm644 \
        "$srcdir/opt/brother/Printers/HLL6250DW/inf/brHLL6250DWfunc" \
        "$pkgdir/usr/share/Brother/Printer/HLL6250DW/inf/brHLL6250DWfunc"

    install -Dm644 \
        "$srcdir/opt/brother/Printers/HLL6250DW/inf/brHLL6250DWrc" \
        "$pkgdir/usr/share/Brother/Printer/HLL6250DW/inf/brHLL6250DWrc"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/HLL6250DW/inf/setupPrintcap" \
        "$pkgdir/usr/share/Brother/Printer/HLL6250DW/inf/setupPrintcap"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/HLL6250DW/lpd/brprintconflsr3" \
        "$pkgdir/usr/share/Brother/Printer/HLL6250DW/lpd/brprintconflsr3"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/HLL6250DW/lpd/filter_HLL6250DW" \
        "$pkgdir/usr/share/Brother/Printer/HLL6250DW/lpd/filter_HLL6250DW"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/HLL6250DW/lpd/rawtobr3" \
        "$pkgdir/usr/share/Brother/Printer/HLL6250DW/lpd/rawtobr3"
}
