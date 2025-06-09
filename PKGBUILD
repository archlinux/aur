# Maintainer: Arnaud Berthomier <arnaud@cyprio.net>
pkgname=brother-dcp-t536dw
_printer=dcpt536dw
pkgver=3.6.1
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-T536DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadtop.aspx?c=us_ot&lang=en&prod=dcpt536dw_all"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf106523/${_printer}pdrv-${pkgver}-1.amd64.deb")
sha256sums=("a876678fa86d524d671a9ac3eedc7130b265b9ff9425d83945f317b299872b0b")
depends=('cups')

package() {
    tar -xf data.tar.gz -C "$pkgdir"

    cd "$pkgdir"

    install -Dm644 "opt/brother/Printers/$_printer/cupswrapper/brother_${_printer}_printer_en.ppd" \
        -t "usr/share/cups/model/Brother"

    install -Dm644 "opt/brother/Printers/$_printer/cupswrapper/brother_${_printer}_printer_en.ppd" \
        -t "usr/share/ppd/Brother"

    mkdir -p -m755 "$pkgdir/usr/lib/cups/filter"
    ln -s "/opt/brother/Printers/$_printer/cupswrapper/brother_lpdwrapper_$_printer" \
        "usr/lib/cups/filter"
}
