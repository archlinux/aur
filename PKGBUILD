# Maintainer: Joerg Weislogel <mutoroglin [at] posteo  [dot] de>

DLAGENTS=("https::/usr/bin/curl \
                --cookie 'essentialCookies=true;internalCookies=false;marketingCookies=false;terms-of-use=true' \
                %u \
                -o %o")

pkgname=kyocera-print-driver
pkgver=1.1203
pkgrel=2
epoch=
pkgdesc="Kyocera linux driver for models FS-1020, FS-1025, FS-1120, FS-1125, FS-1040, FS-1041, FS-1060, FS-1061"
arch=('x86_64')
url='https://www.kyoceradocumentsolutions.eu/'
license=('custom:proprietary')
depends=('libcups')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=('rastertokpsl=${pkgver}')
conflicts=('rastertokpsl' 'rastertokpsl-fs-1040' 'rastertokpsl-git')
source=("$pkgname-$pkgver.zip::https://www.kyoceradocumentsolutions.eu/content/download-center/eu/drivers/all/LinuxDrv_1_1203_FS_1x2xMFP_zip.download.zip"
        "$pkgname-$pkgver-license.pdf::https://www.kyoceradocumentsolutions.eu/content/dam/kyocera/common/documents/20181012%20Terms%20to%20accept%20before%20downloadingv2.pdf")
noextract=("$pkgname-$pkgver-license.pdf")
md5sums=('203cd4492c2b22b4fad046b67b4b022e'
         '4fb159cde2f3de8bb0c9533ab1f934a2')

package() {
  cp Linux/64bit/Global/English.tar.gz .
  tar -xzf English.tar.gz
  cp English/Kyocera_FS*.ppd .
  cp English/rastertokpsl .
  rm English.tar.gz
  rm -R Linux English

  install -Dm644 $pkgname-$pkgver-license.pdf "${pkgdir}/usr/share/licenses/${pkgname}/$pkgname-$pkgver-license.pdf"

  install -Dm644 Kyocera_FS-1020MFPGDI.ppd    "${pkgdir}/usr/share/cups/model/kyocera/Kyocera_FS-1020MFPGDI.ppd"
  install -Dm644 Kyocera_FS-1025MFPGDI.ppd    "${pkgdir}/usr/share/cups/model/kyocera/Kyocera_FS-1025MFPGDI.ppd"
  install -Dm644 Kyocera_FS-1040GDI.ppd       "${pkgdir}/usr/share/cups/model/kyocera/Kyocera_FS-1040GDI.ppd"
  install -Dm644 Kyocera_FS-1060DNGDI.ppd     "${pkgdir}/usr/share/cups/model/kyocera/Kyocera_FS-1060DNGDI.ppd"
  install -Dm644 Kyocera_FS-1120MFPGDI.ppd    "${pkgdir}/usr/share/cups/model/kyocera/Kyocera_FS-1120MFPGDI.ppd"
  install -Dm644 Kyocera_FS-1125MFPGDI.ppd    "${pkgdir}/usr/share/cups/model/kyocera/Kyocera_FS-1125MFPGDI.ppd"
  install -Dm755 rastertokpsl                 "${pkgdir}/usr/lib/cups/filter/rastertokpsl"

}
