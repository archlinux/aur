# Maintainer: TouchFish Community <johnchiao@outlook.com>
pkgname=touchfish
pkgver=4.7.0
pkgrel=1
pkgdesc="FOSS multi-distribution LAN chatting tool"
arch=('any')
url="https://github.com/touchfish-devs/TouchFish-AUR"
license=('MIT')
depends=('python')                 # 仅需 Python 标准库，无第三方依赖
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/touchfish-devs/TouchFish-AUR/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/TouchFish-AUR-$pkgver"
    cat > "$pkgname.desktop" << EOF
[Desktop Entry]
Type=Application
Name=TouchFish
Comment=$pkgdesc
Exec=/usr/bin/$pkgname
Icon=/usr/share/pixmaps/$pkgname.ico
Terminal=true
Categories=Network;InstantMessaging;
EOF
}

build() {
    true
}

package() {
    cd "$srcdir/TouchFish-AUR-$pkgver"

    # 安装主程序
    install -Dm755 LTS.py "$pkgdir/usr/bin/$pkgname"

    # 安装图标
    install -Dm644 TouchFish.ico "$pkgdir/usr/share/pixmaps/$pkgname.ico"

    # 安装 .desktop 文件
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # 安装文档和许可证
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
