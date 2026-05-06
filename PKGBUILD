# Maintainer: BillyJR <your-email@example.com>
# Contributor: BillyJR <your-email@example.com>

pkgname=wallhaven-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="一款优雅的跨平台桌面壁纸浏览与下载应用"
arch=('x86_64')
url="https://github.com/xiaobili/wallhaven"
license=('MIT')
depends=(
    'gtk3'
    'libnotify'
    'nss'
    'libxss'
    'at-spi2-core'
    'libdrm'
    'libxkbcommon'
    'mesa'
)
install="$pkgname.install"
source=("wallhaven-$pkgver.pacman::https://github.com/xiaobili/wallhaven/releases/download/v$pkgver/wallhaven-$pkgver.pacman")
sha256sums=('fcf470e78f99845e02ac91bb9c8df2c092e4062a6c4262a186131ae0779ee66e')

package() {
    # 解压 .pacman 文件到目标目录，排除 pacman 元数据文件
    tar -xJf "$srcdir/wallhaven-$pkgver.pacman" -C "$pkgdir" --exclude='.{MTREE,PKGINFO,BUILDINFO}'

    # 安装许可证文件（如果存在）
    install -Dm644 "$pkgdir/usr/share/licenses/wallhaven/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
