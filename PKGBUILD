# Maintainer: Joshua Ward <joshuaward@myoffice.net.au>
# Contributor: Vojtěch Kusý <https://github.com/wojtha>
# Contributor: Michel Wohlert <michel.wohlert@gmail.com>


pkgname=balsamiqmockups
pkgver=3.5.17
license=('custom')
pkgrel=6
arch=('any')
pkgdesc="The Adobe Air based Mockup client. Not free or open source, there is a 30 day free trial."
url='http://balsamiq.com/products/mockups'
source=("https://builds.balsamiq.com/mockups-desktop/Balsamiq_Mockups_${pkgver}_bundled.zip"
        "http://media.balsamiq.com/files/BalsamiqEula.pdf"
        'balsamiqmockups.desktop')
sha1sums=('f302eaf35ab51cdc42b5040dd5e2f8d15b348cbf'
          '4747058d569211132811e6f13b80d51b701cfb96'
          'cfe7240b7403ff47d63e9f8264581a40112607ff')
install=balsamiqmockups.install
depends=(wine desktop-file-utils lib32-libgl)
makedpends=(unzip)
conflicts=('balsamiq-mockups')

package () {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/balsamiq"

#  install -Dm644 BalsamiqEula.pdf "/usr/share/licenses/balsamiqmockups/BalsamiqEula.pdf"
  cp -pr "${srcdir}/Balsamiq_Mockups_3/." "${pkgdir}/opt/balsamiq"
  mv "${pkgdir}/opt/balsamiq/Balsamiq Mockups 3.exe" "${pkgdir}/opt/balsamiq/balsamiq.exe"
  
  install -dm755 "${pkgdir}/usr/bin"
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/balsamiqmockups"
  echo "wine /opt/balsamiq/balsamiq.exe" >> "${pkgdir}/usr/bin/balsamiqmockups"
  chmod 755 "${pkgdir}/usr/bin/balsamiqmockups"
  
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
