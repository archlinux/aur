# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=6.2.01
pkgrel=1
pkgdesc="An easy-to-use, free of charge, photo server for your home network"
arch=('any')
url="http://www.picapport.de/"
license=('CC BY-NC-ND 4.0')
depends=('java-runtime-headless')
optdepends=('java-openjfx: for running the interactive GUI')
source=("${pkgname}.jar::http://www.picapport.de/download/${pkgver//\./-}/jar/picapport.jar")

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

sha1sums=('c9f79d2b1ea4c3c9c89bc29f145cd3e24422d3cf')
sha256sums=('e663e50ebcc900fa959737cddca797b8e9a0da4f15739bd7b1439076877d0100')
