# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=czkawka-gui-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Multi functional app to find duplicates, empty folders, similar images etc (GUI)"
arch=('x86_64')
url='https://github.com/qarmin/czkawka'
license=('MIT')
provides=("${pkgname%-bin}" 'czkawka')
depends=('gtk3')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}::https://github.com/qarmin/czkawka/releases/download/${pkgver}/linux_czkawka_gui"
        "LICENSE::https://github.com/qarmin/czkawka/raw/master/LICENSE"
        "czkawka-gui.png")
sha256sums=('b05de15dd339f6e2feec7367786230817260d42af9857626a8e8b43c2ab1649e'
            '84491ccaa30b5e85d0607df4abc456b016a1726857d84777f32e2d39c3f4d5e2'
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
