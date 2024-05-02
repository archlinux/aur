# Maintainer: jose <jose1711 [at] gmail (dot) com>
# Contributor: Avi H.D. <strykar@hotmail.com>

pkgname=yass-karaoke
pkgver=2.5.0
pkgrel=1
pkgdesc="Editor for creating, fine-tuning, organizing and printing Ultrastar karaoke songs"
arch=('i686' 'x86_64')
url="http://yass-along.com/"
license=('GPL')
depends=('java-runtime' 'bash')
makedepends=('unzip')
source=("http://yass-along.com/data/downloads/yass-${pkgver}.jar"
	"yass.desktop")
sha256sums=('66ea54c1228157857f7b226adfcc5fa5edceceffc287197c69190a42398f596f'
         '2b5ba508edf7b528004b84fe1f86186220f34b73429e718264707bccbfab128d')
options=(!strip)
noextract=("yass-${pkgver}.jar")

package() {
  cd "${srcdir}"
  install -Dm 644 "${srcdir}/yass-${pkgver}.jar" "${pkgdir}/usr/share/java/yass-${pkgver}.jar"
  unzip -o "yass-${pkgver}.jar" yass/resources/icons/yass-icon.png 
  install -dm 755 "${pkgdir}/usr/bin"
  install -Dm 644 "${srcdir}/yass.desktop" "${pkgdir}/usr/share/applications/yass.desktop"
  install -Dm 644 "${srcdir}/yass/resources/icons/yass-icon.png" "${pkgdir}/usr/share/pixmaps/yass.png"
  (echo "#!/bin/bash
  java -jar \"/usr/share/java/yass-${pkgver}.jar\" \"\$@\"" ; )  > "${pkgdir}/usr/bin/yass.sh"
  chmod 755 "${pkgdir}/usr/bin/yass.sh"
}
