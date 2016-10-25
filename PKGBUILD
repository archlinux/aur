# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=6.2.02
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

sha1sums=('aa672d0a1b39b985a94bf20df4b94e1346f63b01')
sha256sums=('36653b853adf4aff6efa0c28a1b1c3b70b9a667181271b3ad232a485ea418458')
