# Maintainer: Ryan Yuan <ryanyuanzhehan@gmail.com>
# Contributor: HappyCadogt
pkgname=cat-cursors-git
pkgver=0.r1.g0000000
pkgrel=2
pkgdesc="A Cat Cursor Theme. Created by Bilibili user 406949928 (HappyCadogt), ported by GitHub user Tseshongfeeshur (Ryan)."
arch=('any')
url="https://github.com/Tseshongfeeshur/cat-cursors"
license=('MIT')
makedepends=('git' 'imagemagick' 'xorg-xcursorgen')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/cat-cursors"
    # 旧
    # git describe --long --tags 2>/dev/null | sed 's/^v//; s/-/.r/; s/-/./'
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/cat-cursors/sources"
    chmod +x ./build.sh
    ./build.sh

    # 复制构建结果
    install -dm755 "$pkgdir/usr/share/icons"
    cp -a --no-preserve=ownership cat_cursors "$pkgdir/usr/share/icons/"

    # 安装许可文件
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
