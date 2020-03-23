# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=8.2.02
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

sha1sums=('b9c68b07f135a42f747d479d041139c16dc27c49')
sha256sums=('ccb0cf6885ea09ef9f5383b62aee7b76d302e85416b39eae93c73cf561e76b9c')
