# Maintainer: flan_suse <windows2linux_AT_zoho_DOT_com>
# Contributor: Arne Brücher <archlinux [at] arne-bruecher [dot] de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

# This prebuilt binary includes HEIF support.

pkgname=czkawka-gui-bin
pkgver=7.0.0
pkgrel=1
pkgdesc='Find and manage duplicate files, empty folders, similar images, and other "lint" (GUI, with HEIF support)'
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=('czkawka-gui')
conflicts=('czkawka-gui')
depends=('gtk4')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_czkawka_gui_libraw_heif"
        "LICENSE::https://github.com/qarmin/czkawka/raw/master/czkawka_gui/LICENSE"
        "czkawka-gui.png")

sha256sums=('184f049d040d93a9b16a96c2e6c53a1b17e8590c5dc03a7f6bdb36d3b75f09fb'
            'de1d794af7529bc9abb6a1aef6ec2af21fa2bfa4284742144bc30246005b4212'
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
