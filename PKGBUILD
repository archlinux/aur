# Maintainer: yeah <yeah_yaojiu@163.com>

pkgname=piliplus-bin
pkgver=1.1.5.4
pkgrel=1
url="https://github.com/bggRGjQaUbCoE/PiliPlus"
pkgdesc="A Bilibili third-party client built with Flutter. | 使用Flutter开发的BiliBili第三方客户端"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gtk3' 'mpv' 'libayatana-appindicator')
provides=('piliplus')
conflicts=('piliplus' 'piliplus-git')
source_x86_64=("https://github.com/bggRGjQaUbCoE/PiliPlus/releases/download/1.1.5.4/PiliPlus_linux_1.1.5%2B4543_amd64.tar.gz")

options=('!debug' '!strip')

sha256sums_x86_64=('35499a0f9eff5dea96b840d97bc79f5b092af5389ba4c65d15cae0482c9cd5d5')


package() {

  install -d "$pkgdir/opt/$pkgname"
  
  install -Dm755 "$srcdir/piliplus" "$pkgdir/opt/$pkgname/piliplus"
  cp -r "$srcdir/lib" "$pkgdir/opt/$pkgname/"
  cp -r "$srcdir/data" "$pkgdir/opt/$pkgname/"


 install -Dm644 "$srcdir/data/flutter_assets/assets/images/logo/logo.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=PiliPlus
Comment=A Bilibili third-party client built with Flutter.
Exec=piliplus
Icon=$pkgname
Terminal=false
Type=Application
Categories=Utility;Network;Video;
EOF

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/piliplus" "$pkgdir/usr/bin/piliplus"
}
