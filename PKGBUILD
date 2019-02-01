# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=jdotxt
pkgver=0.4.8
pkgrel=1
pkgdesc="cross-platform desktop tool for managing your todo list"
arch=('any')
url="http://blog.chschmid.com/?p=1305"
license=('GPL')
depends=('java-runtime')
source=("http://dl.bintray.com/chschmid/generic/${pkgname}-${pkgver}.jar"
        "jdotxt.desktop")
noextract=("${pkgname}-${pkgver}.jar")

package() {
  cd "${srcdir}"

  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "${srcdir}/${pkgname}.desktop" ${pkgdir}/usr/share/applications/$pkgname.desktop

  install -d "${pkgdir}"/usr/bin
  cat <<EOF >"${pkgdir}/usr/bin/jdotxt"
#!/bin/sh
java -jar "/usr/share/java/${pkgname}/${pkgname}.jar"
EOF
  chmod 755 "${pkgdir}"/usr/bin/$pkgname
  unzip -o "${pkgname}-${pkgver}.jar" res/drawable/jdo512.png
  install -Dm644 res/drawable/jdo512.png "${pkgdir}/usr/share/pixmaps/jdotxt.png"
}
md5sums=('544ee473a88d87d985855f7e4c08e3ad'
         '37a8c6976423de588d2982c9e28674a7')
