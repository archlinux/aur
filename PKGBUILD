# Maintainer: Federico Abella <fedev dot aur at proton dot me>

pkgname=brother-dcp-t230
pkgver=3.6.1_1
pkgrel=1
pkgdesc="CUPS driver for Brother DCP-T230 printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=mx&lang=es&prod=dcpt230_all"
license=("EULA")
depends=("cups")
optdepends=(
    "sane: Scanner support"
    "brscan5: Brother support for sane"
)
options=("!debug")
install="brother-dcp-t230.install"
source=("https://download.brother.com/welcome/dlf106505/dcpt230pdrv-${pkgver//_/-}.amd64.deb")
sha256sums=("0638d91802ab1f8a32998d00cd8cb305cbf436c72eba884578d8b25a24a953b5")

package() {
    tar -xf data.tar.gz -C "$pkgdir"

    cd "$pkgdir"

    ln -s "/opt/brother/Printers/dcpt230/lpd/$CARCH/brdcpt230filter" \
        "opt/brother/Printers/dcpt230/lpd"
    ln -s "/opt/brother/Printers/dcpt230/lpd/$CARCH/brprintconf_dcpt230" \
        "opt/brother/Printers/dcpt230/lpd"

    install -Dm644 "opt/brother/Printers/dcpt230/cupswrapper/brother_dcpt230_printer_en.ppd" \
        -t "usr/share/cups/model/Brother"
    install -Dm644 "opt/brother/Printers/dcpt230/cupswrapper/brother_dcpt230_printer_en.ppd" \
        -t "usr/share/ppd/Brother"

    mkdir -p -m755 usr/lib/cups/filter
    ln -s "/opt/brother/Printers/dcpt230/cupswrapper/brother_lpdwrapper_dcpt230" \
        usr/lib/cups/filter

    mkdir -p -m755 usr/bin
    ln -s "/opt/brother/Printers/dcpt230/lpd/brprintconf_dcpt230" \
        usr/bin
}
