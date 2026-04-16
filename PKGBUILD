# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-base16-git
_pkgname="${pkgname%-git}"
pkgver=r148.4a6ef31
pkgrel=1
pkgdesc="Neovim plugin for building base16 colorschemes"
arch=('any')
url="https://github.com/rrethy/base16-nvim"
license=('MIT')
groups=('neovim-plugins')
makedepends=('git')
provides=("$_pkgname" 'base16-nvim')
conflicts=("$_pkgname" 'base16-nvim')
install=base16.install
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    depends=('neovim')
    cd "$_pkgname"
    local dirs=(colors doc lua templates)
    find "${dirs[@]}" -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
