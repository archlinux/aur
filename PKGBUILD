# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

# This prebuilt binary includes HEIF support.

pkgname=czkawka-gui-bin
pkgver=6.0.0
pkgrel=2
pkgdesc="Multi functional app to find duplicates, empty folders, similar images etc (GUI)"
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('czkawka-gui')
conflicts=('czkawka-gui')
depends=('gtk4')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_czkawka_gui_heif"
        "LICENSE::https://github.com/qarmin/czkawka/raw/master/LICENSE"
        "czkawka-gui.png")

sha256sums=('3144391e91bd6034cd49356e71505846eafef92d3d904a7008fed737f9f7db69'
            'fb89cb6b3ae375f493e6d52b6b28ca279f91446975e66cf0836c441f1cbca3fa'
            '1614565bc6f143b4bb4fc80c71cb1fe0b2ba2719037046719d5a3a89c3f5905e')

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 ${pkgname%-bin}.png -t "${pkgdir}/usr/share/pixmaps"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Czkawka" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
