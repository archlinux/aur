# Maintainer: lyj <lyj404@gmail.com>
pkgname=bettbox-bin
pkgver=1.17.10
pkgrel=1
pkgdesc="基于 Mihomo（Clash.Meta 内核）的多平台代理客户端"
arch=('x86_64' 'aarch64')
url="https://github.com/appshubcc/Bettbox"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libayatana-appindicator'
  'libkeybinder3'
)
options=('!strip' '!debug')
source_x86_64=("${url}/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/Bettbox-${pkgver}-linux-arm64.deb")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  bsdtar -xf data.tar.zst -C "${srcdir}"

  # 应用主体
  install -dm755 "${pkgdir}/usr/share/Bettbox"
  cp -a "${srcdir}/usr/share/Bettbox/"* "${pkgdir}/usr/share/Bettbox/"

  # 创建 /usr/bin 符号链接
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/share/Bettbox/Bettbox "${pkgdir}/usr/bin/Bettbox"

  # 桌面快捷方式
  install -Dm644 "${srcdir}/usr/share/applications/Bettbox.desktop" \
    "${pkgdir}/usr/share/applications/Bettbox.desktop"

  # 图标
  for size in 128 256; do
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/Bettbox.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/Bettbox.png"
  done
}
