# Maintainer: sahdu sahduausds@foxmail.com
pkgname=clash-party-bin
pkgver=1.8.8
pkgrel=5  # 增加版本号
pkgdesc="A Clash client with party features"
arch=('x86_64')
url="https://github.com/mihomo-party-org/clash-party"
license=('GPL')
depends=('gtk3' 'nss' 'libxss' 'libappindicator-gtk3' 'libnotify' 'libcups' 'libsecret' 'libxtst' 'alsa-lib')
source=("$pkgname-$pkgver.deb::https://github.com/mihomo-party-org/clash-party/releases/download/v$pkgver/clash-party-linux-$pkgver-amd64.deb")
sha256sums=('SKIP')

package() {
    # 解压deb包
    ar x "$pkgname-$pkgver.deb"
    tar -xf data.tar.* -C "$pkgdir" --strip-components=1

    # 修复主程序权限
    chmod +x "$pkgdir/opt/mihomo-party/mihomo-party"

    # 修复所有sidecar内核文件权限
    chmod +x "$pkgdir/opt/mihomo-party/resources/sidecar/mihomo"
    chmod +x "$pkgdir/opt/mihomo-party/resources/sidecar/mihomo-alpha"
    chmod +x "$pkgdir/opt/mihomo-party/resources/sidecar/mihomo-smart"

    # 修复其他可能需要的可执行文件
    chmod +x "$pkgdir/opt/mihomo-party/chrome-sandbox"
    chmod +x "$pkgdir/opt/mihomo-party/chrome_crashpad_handler"

    # 创建符号链接
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/mihomo-party/mihomo-party" "$pkgdir/usr/bin/mihomo-party"
    ln -sf "/opt/mihomo-party/mihomo-party" "$pkgdir/usr/bin/clash-party"
}
