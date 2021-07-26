# Maintainer: Joshua Ward <joshuaward@myoffice.net.au>
# Contributor: Vojtěch Kusý <https://github.com/wojtha>
# Contributor: Michel Wohlert <michel.wohlert@gmail.com>


pkgname=balsamiqmockups
pkgver=3.5.17
license=('custom')
pkgrel=7
arch=('any')
pkgdesc="The Adobe Air based Mockup client. Not free or open source, there is a 30 day free trial."
url='http://balsamiq.com/products/mockups'
source=("https://builds.balsamiq.com/mockups-desktop/Balsamiq_Mockups_${pkgver}_bundled.zip"
        "http://media.balsamiq.com/files/BalsamiqEula.pdf"
        'balsamiqmockups.desktop')
sha256sums=('52cbeaf56733d07949e71832c382d975ba9475b2858d2b218a90deac5ff63cbe'
          'c3bf7c7e59f72be96ec598142dcf583a7b6f83f1f5f5b48bd299b7f9f0fd5215'
          '0d17c211894fd1e6b8dcda2fb5d36c64a75c198828457db450e5cfef1e81f166')
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
