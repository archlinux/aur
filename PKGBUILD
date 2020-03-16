# Maintainer: Eric Berquist <eric DOT berquist AT gmail>

pkgname=iqmol
pkgver=2.14
pkgrel=1
pkgdesc="A molecular editor and visualization package with Q-Chem integration"
arch=('x86_64')
url="https://iqmol.org"
license=('GPL3')
depends=('qt5-base' 'glu')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}_${pkgver}.deb::http://iqmol.org/download.php?get=${pkgname}_${pkgver}.deb"
        "${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=('12d1510802de9fec2d9443e62a10af28885636a92dbf117212a51f03e5d23b21'
            '193ae2363115dcb66f3c92580579e1d2fd33dd6976ce2a8eb00beaffd9f8e9c5'
            '9a00b3c99fc8c6681c04b95429740ea00d532dc99c5b12e4e09984808c6f91a1')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"
  # Fix ownership and permissions
  find "${pkgdir}/" -exec chown root:root '{}' +
  find "${pkgdir}/" -type d -exec chmod 755 '{}' +
  # Icon and desktop files
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
