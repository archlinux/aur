# Maintainer: Shorin <2433516202@qq.com>
pkgname=cliphist-tui-git
_pkgname=cliphist-tui
_oldpkgname=shorinclip
pkgver=v1.2.0.r45.gcb9040d
pkgrel=1
pkgdesc="A wayland clipboard TUI based on fzf and cliphist. Use chafa for image preview."
arch=('any')
url="https://github.com/SHORiN-KiWATA/cliphist-tui"
license=('MIT')
depends=('fzf' 'cliphist' 'wl-clipboard' 'ffmpegthumbnailer' 'chafa' 'bash')
makedepends=('git')   

provides=("$_pkgname" "$_oldpkgname" "${_oldpkgname}-git") 
conflicts=("$_pkgname" "$_oldpkgname" "${_oldpkgname}-git") 
replaces=("$_oldpkgname" "${_oldpkgname}-git")

source=("git+https://github.com/SHORiN-KiWATA/cliphist-tui.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "v1.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    
    # 1. 安装全新的主程序
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    
    # 2. 建立向后兼容的软链接
    ln -sf "/usr/bin/$_pkgname" "$pkgdir/usr/bin/$_oldpkgname"
}
