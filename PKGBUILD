# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=6.3.05
pkgrel=1
pkgdesc="An easy-to-use, free of charge, photo server for your home network"
arch=('any')
url="http://www.picapport.de/"
license=('CC BY-NC-ND 4.0')
depends=('java-runtime-headless')
optdepends=('java-openjfx: for running the interactive GUI')
source=("${pkgname}.jar::http://www.picapport.de/download/${pkgver//\./-}/picapport.jar")

package() {
  install -Dm644 $pkgname.jar "${pkgdir}/usr/share/java/$pkgname/$pkgname.jar"
  install -d "${pkgdir}/usr/bin"
  cat <<"EOF" >"${pkgdir}/usr/bin/$pkgname"
#!/bin/sh
java -cp /usr/share/java/picapport/picapport.jar de.contecon.picapport.PicApport "$@"
EOF
  cat <<"EOF" >"${pkgdir}/usr/bin/$pkgname-headless"
#!/bin/sh
java -cp /usr/share/java/picapport/picapport.jar de.contecon.picapport.PicApport -pgui.enabled=false "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/$pkgname"
  chmod 755 "${pkgdir}/usr/bin/$pkgname-headless"
}

sha1sums=('9fdecc74532f2103aa54b0447fedee55a92d4f5b')
sha256sums=('ec5676fe1b1e125e616449aacb710c2cf4d2cf9c77922ce33d2f05dc56efc8f0')
