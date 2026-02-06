# Maintainer: Async <your_email@example.com>
pkgname=fcitx5-themes-macos-git
pkgver=r1.1f5a392
pkgrel=1
pkgdesc="Simple macOS style themes for Fcitx5 (Light & Dark)"
arch=('any')
url="https://github.com/yorha2B0826/fcitx5-themes-macos"
license=('MIT')
depends=('fcitx5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/yorha2B0826/fcitx5-themes-macos.git")
sha256sums=('SKIP')

pkgver() {
    cd "fcitx5-themes-macos"
    # 自动生成版本号：提交数.git哈希
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "fcitx5-themes-macos"
    
    # 安装主题文件到 /usr/share/fcitx5/themes/
    install -d "$pkgdir/usr/share/fcitx5/themes"
    cp -r MacOS-Light "$pkgdir/usr/share/fcitx5/themes/"
    cp -r MacOS-Dark "$pkgdir/usr/share/fcitx5/themes/"
    
    # 安装 License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # 安装 README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
