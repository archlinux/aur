# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-zen-mode-git
pkgver=1.4.1.r0.rg8564ce6
pkgrel=1
pkgdesc="Full-screen code editing"
arch=('any')
url="https://github.com/folke/zen-mode.nvim"
license=('Apache-2.0')
groups=('neovim-plugins')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=zen-mode.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    git -C "$pkgname" describe --long --tags --match "v[0-9].*" | sed 's/^v//;s/-/.r/;s/-/.r/'
}

package() {
    depends=('neovim')
    optdepends=('neovim-twilight')
    cd "$pkgname"
    local dirs=(doc lua plugin)
    find "${dirs[@]}" -type f -exec \
        install -Dm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
