# Maintainer: Nk-YMZ <village_flute@outlook.com>
# presenced（AUR 版）：直接从 GitHub release 拉预编译包安装，无本地编译。
# 源码与源码构建版 PKGBUILD 见 url。
pkgname=presenced
pkgver=0.2.0
pkgrel=2
pkgdesc='ThinkPad X1 Carbon Gen 14 ToF daemon: inhibit idle while present, lock on leave, wake on return, and control screens using attention and partial lid closure detection'
arch=('x86_64')
url='https://github.com/Nk-YMZ/thinkpad-x1c-gen14-presenced'
license=('MIT')
depends=('gcc-libs' 'systemd' 'libkscreen')
# 上游包已剥离符号，重新打包时保留原二进制，不生成空的 debug 包。
options=('!strip' '!debug')
install=presenced.install
source=("https://github.com/Nk-YMZ/thinkpad-x1c-gen14-presenced/releases/download/v$pkgver/presenced-$pkgver-$pkgrel-${CARCH}.pkg.tar.zst")
sha256sums=('ccd73188903ee5d4191cdfa5d3bc2a6403d2b7707cd5957ac53a845ef3a0c496')

package() {
    # 下载的即 pacman 包，解包进 pkgdir 并剔除 pacman 专有元数据
    #（它们由本次 makepkg 重新生成，混入会导致冲突/损坏）
    bsdtar -xf "$srcdir/presenced-$pkgver-$pkgrel-${CARCH}.pkg.tar.zst" -C "$pkgdir" \
        --exclude='.PKGINFO' --exclude='.MTREE' --exclude='.BUILDINFO' --exclude='.INSTALL'
}
