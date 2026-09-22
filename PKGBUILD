# Maintainer: Adlyq <adxlyq@gmail.com>
# Proprietary freeware repack. Upstream ships only a rolling "latest" URL,
# so checksums cannot be pinned (same as google-chrome).
pkgname=qwenwork-bin
_pkgname=qwen-work-cn
pkgver=1.0.5
pkgrel=1
pkgdesc="千问办公 (QwenWork) - Alibaba AI office desktop client"
arch=('x86_64' 'aarch64')
url="https://qwenwork.cn"
license=('custom')
options=('!strip' '!debug')
depends=('gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core'
         'util-linux-libs' 'libsecret' 'libnotify' 'alsa-lib' 'libcups')
optdepends=('libappindicator-gtk3: system tray icon support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("qwen-work-cn.desktop")
source_x86_64=("qwenworkcn-linux-amd64.deb::https://assets.qwenwork.cn/release/latest/qwenworkcn-linux-amd64.deb")
source_aarch64=("qwenworkcn-linux-arm64.deb::https://assets.qwenwork.cn/release/latest/qwenworkcn-linux-arm64.deb")
sha256sums=('2795320fa6a054ee35c45d9a19fa75a778a45baa7af724dfd874061d3c452d47')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  local _deb
  if [[ $CARCH == x86_64 ]]; then
    _deb='qwenworkcn-linux-amd64.deb'
  else
    _deb='qwenworkcn-linux-arm64.deb'
  fi

  bsdtar -xf "$srcdir/$_deb" -C "$srcdir" data.tar.xz
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  install -Dm644 "$srcdir/qwen-work-cn.desktop" \
    "$pkgdir/usr/share/applications/qwen-work-cn.desktop"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/apps/QwenWorkCN/qwen-work-cn "$pkgdir/usr/bin/qwen-work-cn"

  chmod 4755 "$pkgdir/opt/apps/QwenWorkCN/chrome-sandbox"
}
