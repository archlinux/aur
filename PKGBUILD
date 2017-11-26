# Maintainer: Gary B <gary600playsmc@gmail.com>
pkgname=canon-imageclass-mf5950dw-printer
pkgver=3.40
pkgrel=1
pkgdesc="Drivers for the Canon imageCLASS MF5950dw laser printer."
arch=("x86_64")
url="https://www.usa.canon.com/internet/portal/us/home/support/details/printers/black-and-white-laser/imageclass-mf5950dw"
license=("custom")

depends_x86_64=("cups" "libcups")
makedepends=("deb2targz")

source=("${pkgname}-source.tar.gz::http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwMzQ0MDE0")
sha256sums=("ef5421f98ae428ad8ad11ed5d9fb0e53bdc03b2693e79d590cf778fbe68250b5")

_sourcefldr="linux-UFRII-drv-v340-02-usen"

build() {
    cd $srcdir
    deb2targz "${_sourcefldr}/64-bit_Driver/Debian/cndrvcups-ufr2-us_3.40-1_amd64.deb"
    cp "${_sourcefldr}/64-bit_Driver/Debian/cndrvcups-ufr2-us_3.40-1_amd64.tar.gz" ./main.tar.gz
    tar -xzf main.tar.gz
}

package() {
    cd $srcdir
    for _file in usr/share/cups/model/*.ppd; do
        install -DTm 644 $_file "${pkgdir}/${_file}"
    done
    install -DTm 644 "${_sourcefldr}/Documents/LICENSE-EN.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
