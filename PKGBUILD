# Maintainer: Allen <allencch at hotmail dot com>

base_pkgname=periodiccalendar
pkgname=${base_pkgname}-jdk
pkgver=3.4.2
pkgrel=3
pkgdesc="Periodic Calendar for tracking women cycle (supports JDK 20)"
arch=('any')
url="http://linuxorg.sf.net/"
license=('GPL3')
depends=('java-runtime')
source=(https://github.com/allencch/periodiccalendar/releases/download/v${pkgver}/periodiccalendar-${pkgver}.jar
        ${base_pkgname}.desktop ${base_pkgname}.png)
md5sums=('de23955e8abbc996b6f660029b0c2364'
         '5b8490188ad00deea39cef729359d39d'
         'c26856c7a8a0045e8aa36f063563f67f')
conflicts=(periodiccalendar)

package() {
  cd "${srcdir}"

  install -Dm644 "${srcdir}"/${base_pkgname}-$pkgver.jar "${pkgdir}"/usr/share/java/${base_pkgname}/${base_pkgname}.jar
  install -Dm644 "${srcdir}"/${base_pkgname}.png "${pkgdir}"/usr/share/pixmaps/${base_pkgname}.png
  install -Dm644 "${srcdir}"/${base_pkgname}.desktop "${pkgdir}"/usr/share/applications/${base_pkgname}.desktop

#creating executable file
  install -d "${pkgdir}"/usr/bin
  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/$base_pkgname
  echo "java -jar /usr/share/java/$base_pkgname/$base_pkgname.jar" >> "${pkgdir}"/usr/bin/$base_pkgname
  chmod 755 "${pkgdir}"/usr/bin/$base_pkgname
}
