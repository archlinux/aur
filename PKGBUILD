# Maintainer: MaoYaotang <maoyaotang@163.com>
pkgname=apktool-toolbox
pkgver=1.0.0
pkgrel=1
pkgdesc="APK全能工具箱 - 解包/打包/签名/查壳/刷机包签名/ADB设备管理"
arch=('x86_64')
url="https://github.com/maoyaotang12/apktool-toolbox"
license=('GPL3')
depends=(
    qt6-base
    android-tools
    android-sdk-build-tools
    unzip
    java-runtime-common
    android-signapk
    android-apktool-git
)
makedepends=(
    gcc
    make
    qt6-tools
)
source=(git+$url.git)
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    # 完全清空 LTO 相关标志
    export CFLAGS="-fno-lto"
    export CXXFLAGS="-fno-lto"
    export LDFLAGS="-fno-lto"
    qmake6 APKTool.pro
    make -j$(nproc)
}

package() {
    install -Dm755 $srcdir/$pkgname/apktool-toolbox "$pkgdir/usr/bin/apktool-toolbox"

    install -Dm644 $srcdir/$pkgname/apktool-toolbox.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/apktool-toolbox.svg"
    install -Dm644 $srcdir/$pkgname/apktool-toolbox.png "$pkgdir/usr/share/pixmaps/apktool-toolbox.png"

    install -Dm644 $srcdir/$pkgname/apktool-toolbox.desktop "$pkgdir/usr/share/applications/apktool-toolbox.desktop"
    install -D -m644 $srcdir/$pkgname/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
