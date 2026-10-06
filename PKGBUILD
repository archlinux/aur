# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-fern
pkgver=1.59.3
pkgrel=1
pkgdesc="General purpose asynchronous tree viewer"
arch=(any)
url="https://github.com/lambdalisue/fern.vim"
license=(MIT)
groups=(vim-plugins)
optdepends=(
    'gomi: trash-bin functionality'
    'trash-cli: trash-bin functionality'
)
checkdepends=(vim-themis)
provides=(neovim-fern)
replaces=(neovim-fern)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('285da55595e7307a2b200594636beef307bd2b3cd0e21695e1485444f5ff13c7')

check() {
    cd "$pkgname-$pkgver"
    themis test
}

package() {
    depends=(vim-plugin-runtime)
    cd "$pkgname-$pkgver"
    find autoload doc ftplugin plugin syntax \
        -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
