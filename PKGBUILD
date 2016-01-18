# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=5.2.05
pkgrel=1
pkgdesc="An easy-to-use, free of charge, photo server for your home network"
arch=('any')
url="http://www.picapport.de/"
license=('CC BY-NC-ND 4.0')
depends=('java-runtime-headless')
optdepends=('java-openjfx: for running the interactive GUI')
source=("${pkgname}.jar::http://www.picapport.de/download/${pkgname}_v${pkgver}_jar.jar")

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

sha1sums=('4430bb661ac2c9e0bec909dbc22aa14e6be3c0f0')
sha256sums=('220b9190713a17eadb1b82769919a0d45d154829a2f952f912489aecb589d4eb')
