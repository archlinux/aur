# Maintainer: Victor de Jong <victor@victordejong.com>
# Based on PKGBUILD for brother-dcpl2627dw (elParaguayo <elparaguayocode@gmail.com>)

pkgname=brother-dcpl2627dwe
pkgver=4.1.0_1
pkgrel=1
pkgdesc="Brother DCP-L2627DWE lpr driver and CUPS wrapper"
arch=('i686' 'x86_64')
url="https://www.brother.nl/ondersteuning/dcp-l2627dwe/downloads"

license=('GPL-2.0-only' 'LicenseRef-custom:brother')
depends=('cups' 'perl')
optdepends=(
    'brscan5: scanner support.'
    'brscan-skey: scanner key tool.'
)
source=(
    "https://download.brother.com/welcome/dlf106019/dcpl2627dwepdrv-${pkgver/_/-}.i386.rpm"
)
sha512sums=(
    '6e820461a0730beaecd3d18d063ac4369d7464b8c510aef1b0c1b7e8f0801d5c8f8c7cebcda9c0fc3d07c2fe00df14abf17bb12fa981c56ac9fd108aeccb8da6'
)

package() {
    mkdir -p ${pkgdir}/usr/share/cups/model/Brother
    mkdir -p ${pkgdir}/usr/lib/cups/filter
    cp ${srcdir}/opt/brother/Printers/DCPL2627DWE/cupswrapper/brother-DCPL2627DWE-cups-en.ppd ${pkgdir}/usr/share/cups/model/Brother/
    cp ${srcdir}/opt/brother/Printers/DCPL2627DWE/cupswrapper/lpdwrapper ${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_DCPL2627DWE

    mkdir -p ${pkgdir}/usr/share/licenses/brother-dcpl2627dwe
    cp ${srcdir}/opt/brother/Printers/DCPL2627DWE/{LICENSE_ENG.txt,LICENSE_JPN.txt} ${pkgdir}/usr/share/licenses/brother-dcpl2627dwe/

    mkdir -p ${pkgdir}/opt/brother/Printers/DCPL2627DWE/lpd/
    cp -r ${srcdir}/opt/brother/Printers/DCPL2627DWE/inf ${pkgdir}/opt/brother/Printers/DCPL2627DWE/
    cp ${srcdir}/opt/brother/Printers/DCPL2627DWE/lpd/lpdfilter ${pkgdir}/opt/brother/Printers/DCPL2627DWE/lpd/
    cp ${srcdir}/opt/brother/Printers/DCPL2627DWE/lpd/${CARCH}/* ${pkgdir}/opt/brother/Printers/DCPL2627DWE/lpd/
    cp -r ${srcdir}/var ${pkgdir}/
}
