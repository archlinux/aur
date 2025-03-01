# Maintainer: Jinn Koriech <brother-hll8240cdw@aur.ixido.net>
# shellcheck disable=SC2034,SC2154,SC2164,SC2174

pkgname=brother-hll8240cdw
_printer=hll8240cdw
pkgver=3.5.1
pkgrel=1
pkgdesc="CUPS wrapper for Brother HL-L8240CDW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/s/id/htmldoc/printer/cv_hll3220cw/uke/html/GUID-2E7A7E59-10C1-4182-864D-7D1C021BC548_1.html"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/pub/com/linux/linux/packages/${_printer}pdrv-${pkgver}-${pkgrel}.i386.deb")
md5sums=('22190a00087deebab492b09afd4b55c2')

package() {
    tar -xf data.tar.gz -C "$pkgdir"

    cd "$pkgdir"

    install -Dm644 "opt/brother/Printers/$_printer/cupswrapper/brother_${_printer}_printer_en.ppd" \
        -t "usr/share/cups/model/Brother"

    install -Dm644 "opt/brother/Printers/$_printer/cupswrapper/brother_${_printer}_printer_en.ppd" \
        -t "usr/share/ppd/Brother"

    [ -d "$pkgdir/usr/lib/cups/filter" ] || mkdir -p -m755 "$pkgdir/usr/lib/cups/filter"
    ln -s "/opt/brother/Printers/$_printer/cupswrapper/brother_lpdwrapper_$_printer" \
        "usr/lib/cups/filter"

}
