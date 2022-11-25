# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=yass-karaoke
pkgver=2.4.0
pkgrel=1
pkgdesc="Editor for creating, fine-tuning, organizing and printing Ultrastar karaoke songs"
arch=('i686' 'x86_64')
url="http://yass-along.com/"
license=('GPL')
depends=('java-runtime' 'bash')
makedepends=('unzip')
source=("http://yass-along.com/data/downloads/yass-${pkgver}.jar"
	"yass.desktop")
sha256sums=('a5b33d5ca79e0b381a9469f650db64945ac05b4e6f46e1aac8ad44ea869ab55c'
         '2b5ba508edf7b528004b84fe1f86186220f34b73429e718264707bccbfab128d')
options=(!strip)
noextract=("yass-${pkgver}.jar")

package() {
  cd "${srcdir}"
  install -Dm644 "${srcdir}/yass-${pkgver}.jar" "${pkgdir}/usr/share/java/yass-${pkgver}.jar"
  unzip -o "yass-${pkgver}.jar" yass/resources/icons/yass-icon.png 
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/yass.desktop" ${pkgdir}/usr/share/applications/yass.desktop
  install -Dm644 "${srcdir}/yass/resources/icons/yass-icon.png" "${pkgdir}/usr/share/pixmaps/yass.png"
  (echo "#!/bin/bash
  java -jar \"/usr/share/java/yass-${pkgver}.jar\" \"\$@\"" ; )  > "${pkgdir}/usr/bin/yass.sh"
  chmod 755 "${pkgdir}/usr/bin/yass.sh"
}
