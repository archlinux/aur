# Maintainer: Tsaitang <tsaitang404 at gmail dot com>
pkgname=univpn
pkgver=10781.18.1.0512
pkgrel=2
pkgdesc="企业级VPN客户端"
arch=('x86_64')
url="https://www.univpn.com/"
license=('unknown')
depends=()
makedepends=('unzip')
source=("https://download.leagsoft.com/download/UniVPN/linux/univpn-linux-64-${pkgver}.zip")
noextract=("univpn-linux-64-${pkgver}.zip")
sha256sums=('854708ffe5761af08d52f98e03996e47bacb4106dc2b6b041ef03b487626ce5e')

prepare() {
  cd "$srcdir" || return
  unzip -qo "univpn-linux-64-${pkgver}.zip"
}

package() {
  cd "$srcdir" || return
  
  # 安装主程序
  install -Dm755 "univpn-linux-64-${pkgver}.run" "$pkgdir/usr/bin/univpn"
  
  # 创建桌面文件
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/univpn.desktop" << EOF
[Desktop Entry]
Name=UniVPN
Comment=UniVPN 客户端
Exec=univpn
Icon=network-vpn
Type=Application
Categories=Network;
EOF
}