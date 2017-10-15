# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=7.0.02
pkgrel=2
pkgdesc="An easy-to-use, free of charge, photo server for your home network"
arch=('any')
url="http://www.picapport.de/"
license=('CC BY-NC-ND 4.0')
depends=('java-runtime-headless' 'shared-mime-info')
optdepends=('java-openjfx: for running the interactive GUI')
source=("${pkgname}.jar::https://www.picapport.de/prepare_download.php?dlfile=${pkgver//\./-}/picapport.jar")

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

md5sums=('59f3ad3de5f37eb445308e1f86109ff7')
sha1sums=('720cc65cedce763ad4f5f7da6b34a65bf3f76e88')
sha256sums=('a58f844325fa5dac5649de37a50a0d44da72621491f41e890cf9c2e7679f748e')
