# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>

# This prebuilt binary supports multiple backends for Slint and includes HEIF and AVIF support.

pkgname=krokiet-bin
pkgver=12.0.0
pkgrel=2
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (Slint GUI of Czkawka, with HEIF support)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('GPL-3.0-only')
provides=('krokiet')
conflicts=('krokiet')
makedepends=('gendesk')
depends=('libheif' 'vulkan-icd-loader')
options=('!debug')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_${pkgname%-bin}_heif_raw_avif_all_backends_x86_64.zip"
        "${pkgname}-${pkgver}.svg::https://raw.githubusercontent.com/qarmin/czkawka/${pkgver}/${pkgname%-bin}/icons/${pkgname%-bin}_logo.svg"
        "LICENSE_CC_BY_4_ICONS-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-bin}/LICENSE_CC_BY_4_ICONS"
        "LICENSE_GPL_APP-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-bin}/LICENSE_GPL_APP"
        "LICENSE_MIT_CODE-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-bin}/LICENSE_MIT_CODE")

sha256sums=('ef583bebb43d0a1c75a5959cc56f04ecfdadac3cd515cae6fee7c9dd604554d1'
            '2e04d60cb940771a159669c3c0eec3812919c730f9fe5cd4a3391c797c8ed80f'
            'e41e4ba0db2f8423d2b7da6948eecc5378ef00ffc98fa01dee51b849ce754c1a'
            '1b685e3eae5ea925fbb2cf4e58fa30e99bed1d4f58c83dc666063e289be09d37'
            'fe124add5f02776eb9152b4e3c343539cf802babd06a09f9c5237448476d8d03')

package() {
  install -Dm755 ${pkgname%-bin} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_CC_BY_4_ICONS-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_CC_BY_4_ICONS"
  install -Dm644 LICENSE_GPL_APP-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_GPL_APP"
  install -Dm644 LICENSE_MIT_CODE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_MIT_CODE"
  install -Dm644 ${pkgname}-${pkgver}.svg "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.svg"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Krokiet" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
