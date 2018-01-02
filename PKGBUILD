# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=7.1.01
pkgrel=1
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

md5sums=('09876963ff1def3a566781fa160a5fb6')
sha1sums=('9c408ec0c44aa9b1d53c62ded38315f88629672b')
sha256sums=('27fd904a0182e2716ecbaa0e4872f32c7e9bcd499df24ecad959e3f342cfbf8c')
