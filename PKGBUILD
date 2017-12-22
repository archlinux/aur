# Maintainer: John K. Luebs <jkl@johnluebs.com>
# Contributor: Vojtěch Kusý <https://github.com/wojtha>
# Contributor: Michel Wohlert <michel.wohlert@gmail.com>


pkgname=balsamiqmockups
pkgver=3.5.15
license=('custom')
pkgrel=5
arch=('any')
pkgdesc="The Adobe Air based Mockup client. Not free or open source, there is a 30 day free trial."
url='http://balsamiq.com/products/mockups'
source=("https://builds.balsamiq.com/mockups-desktop/Balsamiq_Mockups_3.5.15_bundled.zip"
        "http://media.balsamiq.com/files/BalsamiqEula.pdf"
        'balsamiqmockups.desktop')
sha1sums=('23299c28ca3dfb87ba55df193682a23e31f232cd'
          '28c31aa6fbe94d03f622093e274f0398e7bfdb34'
          'cfe7240b7403ff47d63e9f8264581a40112607ff')
install=balsamiqmockups.install
depends=(wine desktop-file-utils lib32-libgl)
makedepends=(unzip)
conflicts=('balsamiq-mockups')

package () {
  cd "${srcdir}"

  install -dm755 "${pkgdir}/opt/balsamiq"

  install -Dm644 BalsamiqEula.pdf "${pkgdir}/usr/share/licenses/balsamiqmockups/BalsamiqEula.pdf"
  cp -pr "${srcdir}/Balsamiq_Mockups_3/." "${pkgdir}/opt/balsamiq"
  mv "${pkgdir}/opt/balsamiq/Balsamiq Mockups 3.exe" "${pkgdir}/opt/balsamiq/balsamiq.exe"
  
  install -dm755 "${pkgdir}/usr/bin"
  echo "#!/bin/bash" > "${pkgdir}/usr/bin/balsamiqmockups"
  echo "wine /opt/balsamiq/balsamiq.exe" >> "${pkgdir}/usr/bin/balsamiqmockups"
  chmod 755 "${pkgdir}/usr/bin/balsamiqmockups"
  
  install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
