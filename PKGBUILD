# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin, Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2-xatrix'
pkgver=2.13
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Quake II - Mission Pack 1 ('The Reckoning') for yamagi-quake2"
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0' 'custom')
depends=('sh' 'yamagi-quake2')
install="${pkgname}.install"
source=("https://deponie.yamagi.org/quake2/${pkgname#*-}-${pkgver}.tar.xz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('abb9086e7b449b09e01f78bf4a1e17550d962a563af58e5708bbdc39b376508b1f4e9c39249117d2f33b26270275fa60ce75866d591742c0d913827726843382'
            'dfb3ff7bbe6149d768b56ce0c1963b65aa062bd3bfcfd87facf56c195c9c55deb845085cecc7aff89ee350c75662d1c3f2bc70c3cbf7218629a25c3e55f81ebe'
            '1bf3b87cc0523168437fbf99965a136d7f7cbb14edb1edb88a8fd7df3f043ff3e01e0722262a97158bcebb89463dfe08fe0b0664e1ecc23ba1e932d7847178cb')

build() {
  make -C "${pkgname#*-}-${pkgver}"
}

package() {
  cd "${pkgname#*-}-${pkgver}"

  # game library
  install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/xatrix" 'release/game.so'

  # game launcher
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # doc
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README'

  # desktop entry
  install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"

  # license
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
