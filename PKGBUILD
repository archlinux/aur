# Maintainer: yeah <yeah_yaojiu@163.com>
# Contributor: nlsdt <nlsdt@nlsdt.cc>

pkgname=piliplus-bin
_pkgname=piliplus
pkgver=2.1.2.2
pkgrel=1
url="https://github.com/bggRGjQaUbCoE/PiliPlus"
pkgdesc="A Bilibili third-party client built with Flutter. | 使用Flutter开发的BiliBili第三方客户端"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gtk3' 'mpv' 'libayatana-appindicator' 'webkit2gtk-4.1')
provides=('piliplus')
conflicts=('piliplus' 'piliplus-git')
source_x86_64=("https://github.com/bggRGjQaUbCoE/PiliPlus/releases/download/2.1.2.2/PiliPlus_linux_2.1.2%2B5277_amd64.tar.gz"
               "com.example.piliplus.desktop::https://raw.githubusercontent.com/bggRGjQaUbCoE/PiliPlus/main/assets/linux/com.example.piliplus.desktop")

options=('!debug' '!strip')

sha256sums_x86_64=('d8118120e7c16e8a3a84458a4b7acc9611ab213cb6e3229b28fcc4b3ed990253'
                   'da0eca41a99b9764de4069ce05ee4cf4067010ebe50fc5ad6f08cf4cf7cc7df0')

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
