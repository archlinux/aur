# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin, Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2-rogue'
pkgver=2.12
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Mission Pack 2 ('Ground Zero') for yamagi-quake2"
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0' 'custom')
depends=('sh' 'yamagi-quake2')
install="${pkgname}.install"
source=("https://deponie.yamagi.org/quake2/${pkgname#*-}-${pkgver}.tar.xz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('d63b8ecd5297510606f9dae9b09da0924c464a55a25079828af6222a3eeca696fde693702071b2182f2fb99ba44a627614df9a1f77fafbab1f6181d90b2d1198'
            '5c124891f985f4777be3b402c5579b0bf6c0c4651921cbe3ca1deb1c64e1486c97b017fdd633de3c90ceb588efbf18a9393531d2eb2ec28a6e2896866863d9a9'
            'e535b2a1e1ea583997ac889eccc9243b3628c733999f0cfebe170c08a5659b0971864c4117c5b5c1eaa99e0714a775f8c52841c1f611297128e26bf291d391ac')

build() {
  make -C "${pkgname#*-}-${pkgver}"
}

package() {
  cd "${pkgname#*-}-${pkgver}"

  # game library
  install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/rogue" 'release/game.so'

  # game launcher
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # doc
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README'

  # desktop entry
  install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"

  # license
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
