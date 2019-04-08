# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=picapport
pkgver=7.4.01
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

sha1sums=('9b02a8986461e78f1bf82e4c9937b60c2423c438')
sha256sums=('90549a223464058c0415f2fa5fe09657359021acf9b40b43a9b847d712d75a07')
