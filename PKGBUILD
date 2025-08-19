# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

# This prebuilt binary includes HEIF support.

pkgname=czkawka-gui-bin
pkgver=10.0.0
pkgrel=1
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (GUI, with HEIF support)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('czkawka-gui')
conflicts=('czkawka-gui')
depends=('gtk4' 'libheif')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_${pkgname%-gui-bin}_gui_heif_raw_x86_64"
        "${pkgname}-${pkgver}.png::https://raw.githubusercontent.com/qarmin/czkawka/${pkgver}/${pkgname%-gui-bin}_gui/icons/icon_about.png"
        "LICENSE_CC_BY_4_ICONS-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-gui-bin}_gui/LICENSE_CC_BY_4_ICONS"
        "LICENSE_MIT_APP_CODE-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-gui-bin}_gui/LICENSE_MIT_APP_CODE"
        "LICENSE_MIT_WINDOWS_THEME-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-gui-bin}_gui/LICENSE_MIT_WINDOWS_THEME")

sha256sums=('43d7fcb0adcff22454a4014ecf9716f946dc966498584abdccd20ce7b03da188'
            'c727bb66ebf6114296a93384af8c2eaeb19eab06482cdd3176155f8f8eef501f'
            'b2b2392d2ef0a1743ab1b0f14aa178a2269abe6d72a66b84f4891c4a21277fbf'
            '85325b49534d038568a13c5f5d66e77f391b6c4bd274eac4fad3e13a325cce3e'
            'bec0eaf1f5cfc1ac4d5f1e1f1dd7d9c1f1f575701e1deb1ae72e36b5a8ff56b1')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE_CC_BY_4_ICONS-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_CC_BY_4_ICONS"
  install -Dm644 LICENSE_MIT_APP_CODE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_MIT_APP_CODE"
  install -Dm644 LICENSE_MIT_WINDOWS_THEME-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE_MIT_WINDOWS_THEME"
  install -Dm644 ${pkgname}-${pkgver}.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Czkawka" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
