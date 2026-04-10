# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-melange-git
pkgver=20250710.r0
pkgrel=1
pkgdesc='Warm colorscheme for Neovim and beyond'
arch=('any')
url="https://github.com/savq/melange-nvim"
license=('MIT')
groups=('neovim-plugins')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-//;s/-//;s/-/./'
}

package() {
    depends=('neovim')

    cd "$pkgname"
    find autoload colors lua \
        -type f \
        -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    find term -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/$pkgname/{}" \;
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

