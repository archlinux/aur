# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>

# This prebuilt binary includes HEIF support.

pkgname=krokiet-bin
pkgver=10.0.0
pkgrel=1
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (Slint GUI of Czkawka, with HEIF support)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('GPL-3.0-only')
provides=('krokiet')
conflicts=('krokiet')
makedepends=('gendesk')
depends=('libheif')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_${pkgname%-bin}_heif_raw_x86_64"
        "${pkgname}-${pkgver}.png::https://raw.githubusercontent.com/qarmin/czkawka/7.0.0/${pkgname%-bin}/icons/logo.png"
        "LICENSE_CC_BY_4_ICONS-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-bin}/LICENSE_CC_BY_4_ICONS"
        "LICENSE_GPL_APP-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-bin}/LICENSE_GPL_APP"
        "LICENSE_MIT_CODE-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-bin}/LICENSE_MIT_CODE")

sha256sums=('510ce2349f4b20843a2145d3154caaefd12cae2d02f6859980b7c0bf2fa2cb1e'
            'b95b69cf799b047fa9a234c28236afc0bbef4d90327034a5de9ead3d60ea0e9a'
            'd7163908dee6c97dd893c8c3fa6e8766a82d03c7fbcc107647c43d1f0257699c'
            '1b685e3eae5ea925fbb2cf4e58fa30e99bed1d4f58c83dc666063e289be09d37'
            '85325b49534d038568a13c5f5d66e77f391b6c4bd274eac4fad3e13a325cce3e')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_CC_BY_4_ICONS-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_CC_BY_4_ICONS"
  install -Dm644 LICENSE_GPL_APP-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_GPL_APP"
  install -Dm644 LICENSE_MIT_CODE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_MIT_CODE"
  install -Dm644 ${pkgname}-${pkgver}.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Krokiet" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
