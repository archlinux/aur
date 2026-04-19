# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-twilight-git
pkgver=1.0.0.r29.g664e752
pkgrel=1
pkgdesc="Dims inactive portions of code during editing"
arch=('any')
url="https://github.com/folke/twilight.nvim"
license=('Apache-2.0')
groups=('neovim-plugins')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=twilight.install
source=("$pkgname::git+$url?signed")
md5sums=('SKIP')
validpgpkeys=('97ADEDA7F079E45EF2AD1004707FE6FEB82F7984') # Folke Lemaitre

pkgver() {
    git -C "$pkgname" describe --long --tags --match "v[0-9].*" | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    depends=('neovim')
    optdepends=('tree-sitter')
    cd "$pkgname"
    local dirs=(doc lua plugin)
    find "${dirs[@]}" -type f -exec \
        install -Dm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
