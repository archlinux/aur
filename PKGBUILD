# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>

# This prebuilt binary includes HEIF support.

pkgname=krokiet-bin
pkgver=7.0.0
pkgrel=1
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (Slint GUI of Czkawka, with HEIF support)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('krokiet')
conflicts=('krokiet')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_${pkgname%-bin}_libraw_heif"
        "LICENSE-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-bin}/LICENSE"
        "${pkgname}-${pkgver}.png::https://raw.githubusercontent.com/qarmin/czkawka/${pkgver}/${pkgname%-bin}/icons/logo.png")

sha256sums=('8ba83b45a739dd2173eabe8939d03f04f65e4253320bf73eca79acdd52084435'
            '21053c41478ede01bcacd3e2306410b4555a236d189aa0492d9387dee70ff4e0'
            'b95b69cf799b047fa9a234c28236afc0bbef4d90327034a5de9ead3d60ea0e9a')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
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
