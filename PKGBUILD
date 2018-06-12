# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=7.2.00
pkgrel=1
pkgdesc="An easy-to-use, free of charge, photo server for your home network"
arch=('any')
url="http://www.picapport.de/"
license=('CC BY-NC-ND 4.0')
depends=('java-runtime-headless' 'shared-mime-info')
optdepends=('java-openjfx: for running the interactive GUI')
source=("$pkgname-$pkgver.jar::https://www.picapport.de/prepare_download.php?dlfile=${pkgver//\./-}/picapport.jar")

package() {
  install -Dm644 "$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -d "$pkgdir/usr/bin"
  cat <<"EOF" >"$pkgdir/usr/bin/$pkgname"
#!/bin/sh
java -cp /usr/share/java/picapport/picapport.jar de.contecon.picapport.PicApport "$@"
EOF
  cat <<"EOF" >"$pkgdir/usr/bin/$pkgname-headless"
#!/bin/sh
java -cp /usr/share/java/picapport/picapport.jar de.contecon.picapport.PicApport -pgui.enabled=false "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"
  chmod 755 "$pkgdir/usr/bin/$pkgname-headless"
}

sha1sums=('438a53a0067554611da2915e6930e4dc5cdb8528')
sha256sums=('2d5e5011bddc7e5195a2a69a2257aa3397ecc2071d39517e279a288626d49cd1')
