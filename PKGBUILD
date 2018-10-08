# Maintainer: Daniel Cafe

model="hll6402dw"
MODEL="HLL6402DW"

pkgname="brother-${model}"
pkgver="3.2.0_1"
pkgrel=1
pkgdesc="Brother HL-L6402DW CUPS driver"

url="http://brother.com"
arch=('i686' 'x86_64')
license=('GPL')

depends=('cups')
depends_x86_64=('lib32-glibc')

source=("http://download.brother.com/welcome/dlf102572/${model}cupswrapper-3.2.0-1.i386.rpm"
        "http://download.brother.com/welcome/dlf102571/${model}lpr-3.2.0-1.i386.rpm"
        "brother-${model}.patch")

md5sums=('21826a4bf266256afe4e81f83a6ab15c'
         '61a40f6ff2a5d2f03875a270e8d18bd5'
         '1d5900258fec40a29588d0700dd2a742')

prepare() {
    patch -p1 < brother-${model}.patch
}

package() {
    cp -a "$srcdir/var" "$pkgdir"

    install -Dm644 \
        "$srcdir/opt/brother/Printers/${MODEL}/cupswrapper/brother-${MODEL}-cups-en.ppd" \
        "$pkgdir/usr/share/cups/model/brother-${MODEL}-cups-en.ppd"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/${MODEL}/cupswrapper/brother_lpdwrapper_${MODEL}" \
        "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${MODEL}"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/${MODEL}/cupswrapper/paperconfigml1" \
        "$pkgdir/usr/share/Brother/Printer/${MODEL}/cupswrapper/paperconfigml1"

    install -Dm644 \
        "$srcdir/opt/brother/Printers/${MODEL}/inf/br${MODEL}func" \
        "$pkgdir/usr/share/Brother/Printer/${MODEL}/inf/br${MODEL}func"

    install -Dm644 \
        "$srcdir/opt/brother/Printers/${MODEL}/inf/br${MODEL}rc" \
        "$pkgdir/usr/share/Brother/Printer/${MODEL}/inf/br${MODEL}rc"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/${MODEL}/inf/setupPrintcap" \
        "$pkgdir/usr/share/Brother/Printer/${MODEL}/inf/setupPrintcap"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/${MODEL}/lpd/brprintconflsr3" \
        "$pkgdir/usr/share/Brother/Printer/${MODEL}/lpd/brprintconflsr3"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/${MODEL}/lpd/filter_${MODEL}" \
        "$pkgdir/usr/share/Brother/Printer/${MODEL}/lpd/filter_${MODEL}"

    install -Dm755 \
        "$srcdir/opt/brother/Printers/${MODEL}/lpd/rawtobr3" \
        "$pkgdir/usr/share/Brother/Printer/${MODEL}/lpd/rawtobr3"
}
