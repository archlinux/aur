# Maintainer: yeah <yeah_yaojiu@163.com>
# Contributor: nlsdt <nlsdt@nlsdt.cc>

pkgname=piliplus-bin
_pkgname=piliplus
pkgver=2.1.6.2
pkgrel=1
url="https://github.com/bggRGjQaUbCoE/PiliPlus"
pkgdesc="A Bilibili third-party client built with Flutter. | 使用Flutter开发的BiliBili第三方客户端"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gtk3' 'libayatana-appindicator' 'libayatana-indicator' 'mpv' 'webkit2gtk-4.1')
provides=('piliplus')
conflicts=('piliplus' 'piliplus-git')
source_x86_64=("https://github.com/bggRGjQaUbCoE/PiliPlus/releases/download/2.1.6.2/PiliPlus_linux_2.1.6%2B5472_amd64.tar.gz"
               "com.example.piliplus.desktop::https://raw.githubusercontent.com/bggRGjQaUbCoE/PiliPlus/main/assets/linux/com.example.piliplus.desktop")

options=('!debug' '!strip')

sha256sums_x86_64=('271e7911f0a4a676cce7f3584f598980e15a583e683cc39595bf13c13940a052'
                   '7cf1d7180a033f0ba86cc03a0ba652f0e96095713485e25f4a5f9ebf0abbe27c')

package() {
  # 建立目录
  install -d "$pkgdir/opt/$_pkgname"
  install -d "$pkgdir/usr/bin"
  # 安装文件
  install -Dm755 "$srcdir/piliplus" "$pkgdir/opt/$_pkgname/piliplus"
  cp -a "$srcdir/lib" "$pkgdir/opt/$_pkgname/"
  cp -a "$srcdir/data" "$pkgdir/opt/$_pkgname/"
  # 安装图标
  install -Dm644 "$srcdir/data/flutter_assets/assets/images/logo/logo.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  # 安装 .desktop
  install -Dm644 "$srcdir/com.example.piliplus.desktop" \
    "$pkgdir/usr/share/applications/com.example.piliplus.desktop"
  # 链接主程序
  ln -s "/opt/$_pkgname/piliplus" "$pkgdir/usr/bin/piliplus"
}
