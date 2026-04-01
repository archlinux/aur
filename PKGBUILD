# Maintainer: shorin <2433516202@qq.com>
pkgname=shorin-fcitx5-config-git
pkgver=r1.0.0 
pkgrel=1
pkgdesc="Fcitx5 and Rime configurations for Shorin OS"
arch=('any')
url="https://github.com/ShorinOS/shorin-fcitx5-config"
license=('GPL')

# 将输入法相关的具体包依赖放在这里，解耦元包
depends=(
    'fcitx5'
    'fcitx5-configtool'
    'fcitx5-gtk'
    'fcitx5-qt'
    'fcitx5-rime'
    'rime-ice-git'
    'rime-wubi'
)
makedepends=('git')
source=("git+https://github.com/ShorinOS/shorin-fcitx5-config.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    
    local target_dir="$pkgdir/usr/share/shorin-fcitx5-config"
    install -dm755 "$target_dir"
    
    cp -ra . "$target_dir/"
    
    rm -rf "$target_dir/.git"
}
