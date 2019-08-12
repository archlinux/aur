# Maintainer: Eric Berquist <eric DOT berquist AT gmail>

pkgname=iqmol
pkgver=2.13b
pkgrel=1
pkgdesc="A molecular editor and visualization package with Q-Chem integration"
arch=('x86_64')
url="https://iqmol.org"
license=('GPL3')
depends=('qt5-base' 'glu')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}_${pkgver}.deb::http://iqmol.org/download.php?get=${pkgname}_${pkgver}.deb"
        "${pkgname}.png")
md5sums=('2523dc7c85d5af0face568179f99ac8a'
         '82ebad946c038562090f20efa2160929')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}/"
  # Fix ownership and permissions
  find "${pkgdir}/" -exec chown root:root '{}' +
  find "${pkgdir}/" -type d -exec chmod 755 '{}' +
  # Icon and desktop files
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
