# Maintainer: Ryan Yuan <ryanyuanzhehan@gmail.com>
# Contributor: 漓翎_cub <1534183068@qq.com>
pkgname=hei-cursors-git
pkgver=0.r1.g0000000
pkgrel=9
pkgdesc="Hei Cursor Theme. Created by Bilibili user 1013625945 (漓翎_cub), ported by GitHub user Tseshongfeeshur (Ryan)."
arch=('any')
url="https://github.com/Tseshongfeeshur/hei-cursors"
license=('MIT')
makedepends=('git' 'imagemagick' 'xorg-xcursorgen')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/hei-cursors"
    # 旧
    # git describe --long --tags 2>/dev/null | sed 's/^v//; s/-/.r/; s/-/./'
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/hei-cursors/sources"
    chmod +x ./build.sh
    ./build.sh

    # 复制构建结果
    install -dm755 "$pkgdir/usr/share/icons"
    cp -a --no-preserve=ownership hei_cursors "$pkgdir/usr/share/icons/"

    # 安装许可文件
    install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
