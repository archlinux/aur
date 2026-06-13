# Maintainer: yeah <yeah_yaojiu@163.com>

pkgname=piliplus-bin
pkgver=2.0.9.2
pkgrel=1
url="https://github.com/bggRGjQaUbCoE/PiliPlus"
pkgdesc="A Bilibili third-party client built with Flutter. | 使用Flutter开发的BiliBili第三方客户端"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gtk3' 'mpv' 'libayatana-appindicator')
provides=('piliplus')
conflicts=('piliplus' 'piliplus-git')
source_x86_64=("https://github.com/bggRGjQaUbCoE/PiliPlus/releases/download/2.0.9.2/PiliPlus_linux_2.0.9%2B5051_amd64.tar.gz")

options=('!debug' '!strip')

sha256sums_x86_64=('f7f1ecc0d20019e2aef4274d49960ca4be8588f5aa73de6a892831f26f85c94d')


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
