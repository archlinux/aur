# Maintainer: YageGeng <icoderdev@outlook.com>
# 维护者负责 AUR 打包配方，应用和浏览器由上游提供。
pkgname=ccbaga-bin
# 跟随上游稳定版更新，校验和与固定版本下载地址保持一致。
pkgver=0.2.50
pkgrel=1
pkgdesc='Claude maintenance and isolated fingerprint browser toolkit'
arch=('x86_64')
url='https://github.com/liseami/CCBaga'
license=('MIT' 'BSD-3-Clause')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'expat' 'gdk-pixbuf2'
  'glib2' 'glibc' 'gtk3' 'libayatana-appindicator' 'libcups' 'libgcc'
  'libsoup3' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext'
  'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'mesa' 'nspr' 'nss'
  'pango' 'systemd-libs' 'webkit2gtk-4.1' 'xdg-utils' 'zsh'
)
optdepends=('wl-clipboard: Wayland clipboard support'
            'xclip: X11 clipboard support')
provides=("ccbaga=$pkgver")
conflicts=('ccbaga')
# 保持官方宿主和浏览器二进制原样，避免 strip/debug 处理修改预编译文件。
options=('!strip' '!debug')
source=(
  "$url/releases/download/v$pkgver/CCBaga-$pkgver-linux-x86_64.pkg.tar.zst"
  "ccbaga-$pkgver-LICENSE.lobehub.txt::https://raw.githubusercontent.com/liseami/CCBaga/v$pkgver/assets/ai-icons/LICENSE.lobehub.txt"
)
sha256sums=(
  'f7e4977af824e576590c10995c2c98cea9b4070c9c4ed6afdc929cfeb3c55544'
  'add9d7531d1b21646317a8958e38fc727506fa39d24bdecb44154d943c82753a'
)

# 安装官方载荷并归档许可证；仅复制 usr，避免沿用上游 ccbaga-git 的包元数据。
package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/ccbaga-git" "$pkgdir/usr/share/licenses/$pkgname"
  # 上游 Arch 配方漏装了已用于内嵌图标的 LobeHub 许可证，从同版本源码补齐。
  install -Dm644 "$srcdir/ccbaga-$pkgver-LICENSE.lobehub.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.lobehub.txt"
}
