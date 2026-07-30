# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

# This prebuilt binary includes HEIF support.

pkgname=czkawka-gui-bin
pkgver=12.0.1
pkgrel=1
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (GUI, with HEIF support)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('czkawka-gui')
conflicts=('czkawka-gui')
depends=('gtk4' 'libheif')
makedepends=('gendesk')
options=('!debug')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_${pkgname%-gui-bin}_gui_heif_raw_avif_x86_64"
        "${pkgname}-${pkgver}.png::https://raw.githubusercontent.com/qarmin/czkawka/${pkgver}/${pkgname%-gui-bin}_gui/icons/icon_about.png"
        "LICENSE_CC_BY_4_ICONS-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-gui-bin}_gui/LICENSE_CC_BY_4_ICONS"
        "LICENSE_MIT_APP_CODE-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-gui-bin}_gui/LICENSE_MIT_APP_CODE"
        "LICENSE_MIT_WINDOWS_THEME-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-gui-bin}_gui/LICENSE_MIT_WINDOWS_THEME")

sha256sums=('6fd98b20db675d2297af11972451ff8adeb0e83fc6c5939605dd697cf07ca5b8'
            'c727bb66ebf6114296a93384af8c2eaeb19eab06482cdd3176155f8f8eef501f'
            '30186bcd1236627113d89c4c6cbf85f1d3e4f992a5cdf443553be80b5f771916'
            'fe124add5f02776eb9152b4e3c343539cf802babd06a09f9c5237448476d8d03'
            '7e4b81c892b5c8b1743d710189cd73bc7d323feed05414036139dcad65ed4dc4')

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
