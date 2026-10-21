# Maintainer: Nk-YMZ <village_flute@outlook.com>
# presenced（AUR 版）：直接从 GitHub release 拉预编译包安装，无本地编译。
# 源码与源码构建版 PKGBUILD 见 url。
pkgname=presenced
pkgver=0.1.0
pkgrel=2
pkgdesc='ThinkPad X1C Gen14 ToF presence daemon: inhibit idle while present, auto-lock on leave, wake to greeter on return (tested only on X1 Carbon Gen 14)'
arch=('x86_64')
url='https://github.com/Nk-YMZ/thinkpad-x1c-gen14-presenced'
license=('MIT')
depends=('gcc-libs')
install=presenced.install
source=("https://github.com/Nk-YMZ/thinkpad-x1c-gen14-presenced/releases/download/v$pkgver/presenced-$pkgver-$pkgrel-${CARCH}.pkg.tar.zst")
sha256sums=('cf9fffab3bfb5e62e1c7ffd10f274cadaf2cf91d3687797d600118e52a9c2c4a')

package() {
    # 下载的即 pacman 包，解包进 pkgdir 并剔除 pacman 专有元数据
    #（它们由本次 makepkg 重新生成，混入会导致冲突/损坏）
    bsdtar -xf "$srcdir/presenced-$pkgver-$pkgrel-${CARCH}.pkg.tar.zst" -C "$pkgdir" \
        --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO' --exclude='.INSTALL'
}
