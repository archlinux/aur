# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-gitsigns-git
pkgver=2.0.0.r0.g42d6aed
pkgrel=1
epoch=2
pkgdesc="Git signs written in pure Lua"
arch=('any')
url="https://github.com/lewis6991/gitsigns.nvim"
license=('MIT')
groups=('neovim-plugins')
depends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="$pkgname.install"
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    git -C "$pkgname" describe --long --tags --exclude release | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    depends+=('neovim')
    cd "$pkgname"
    find doc lua plugin -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
