# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

# This prebuilt binary includes HEIF support.

pkgname=czkawka-gui-bin
pkgver=9.0.0
pkgrel=1
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (GUI, with HEIF support)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('czkawka-gui')
conflicts=('czkawka-gui')
depends=('gtk4' 'libheif')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_${pkgname%-gui-bin}_gui_heif_libraw"
        "LICENSE-${pkgver}::https://github.com/qarmin/czkawka/raw/${pkgver}/${pkgname%-gui-bin}_gui/LICENSE"
        "${pkgname}-${pkgver}.png::https://raw.githubusercontent.com/qarmin/czkawka/${pkgver}/${pkgname%-gui-bin}_gui/icons/icon_about.png")

sha256sums=('bf2b35f9e232cffa38d97b20457859552b1f2b6153546b5233c167f1f0786448'
            '5373345d840c3285b474380fdad75e3e4d6504a050e7d35b5ca2db8da13844cb'
            'c727bb66ebf6114296a93384af8c2eaeb19eab06482cdd3176155f8f8eef501f')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE-${pkgver} "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
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
