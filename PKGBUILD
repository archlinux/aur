# Maintainer: Dmitry Razumov <asmeron@ublinux.ru>

DLAGENTS=("https::/usr/bin/curl \
                --cookie 'essentialCookies=true;internalCookies=false;marketingCookies=false;terms-of-use=true' \
                %u \
                -o %o")

pkgname=kyocera-taskalfa-1800-2200
pkgver=8.1305
pkgrel=1
pkgdesc="PPD drivers for Kyocera TASKalfa 1800, 1801, 2200, 2201 KPSL printers copiers A3 format"
arch=('x86_64')
url='https://www.kyoceradocumentsolutions.eu/'
license=('custom:proprietary')
depends=('libcups')
makedepends=('tar')
provides=('rastertokpsl_A3=${pkgver}')
source=("${pkgname}-${pkgver}.zip::https://www.kyoceradocumentsolutions.eu/content/download-center/eu/drivers/all/LinuxDrv_8_1305_TASKalfa1801_2201_zip.download.zip"
        "${pkgname}-${pkgver}-license.pdf::https://www.kyoceradocumentsolutions.eu/content/dam/kyocera/common/documents/20181012%20Terms%20to%20accept%20before%20downloadingv2.pdf")
noextract=("${pkgname}-${pkgver}-license.pdf")
md5sums=('14f48f00077ff3d76beda0fff1231ff3'
         '4fb159cde2f3de8bb0c9533ab1f934a2')

prepare(){
  cp Linux/64bit/Global/English.tar.gz .
  tar -xzf English.tar.gz
  cp English/Kyocera*.ppd .
  cp English/rastertokpsl_A3 .
  rm English.tar.gz
  rm -R Linux English
}

package(){
  install -Dm644 ${pkgname}-${pkgver}-license.pdf "${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}-${pkgver}-license.pdf"
  install -Dm644 "Kyocera TASKalfa 1800GDI.ppd" "${pkgdir}/usr/share/cups/model/kyocera/Kyocera TASKalfa 1800GDI.ppd"
  install -Dm644 "Kyocera TASKalfa 1801GDI.ppd" "${pkgdir}/usr/share/cups/model/kyocera/Kyocera TASKalfa 1801GDI.ppd"
  install -Dm644 "Kyocera TASKalfa 2200GDI.ppd" "${pkgdir}/usr/share/cups/model/kyocera/Kyocera TASKalfa 2200GDI.ppd"
  install -Dm644 "Kyocera TASKalfa 2201GDI.ppd" "${pkgdir}/usr/share/cups/model/kyocera/Kyocera TASKalfa 2201GDI.ppd"
  install -Dm755 "rastertokpsl_A3"              "${pkgdir}/usr/lib/cups/filter/rastertokpsl_A3"
}
