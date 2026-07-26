# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-fern
pkgver=1.59.1
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
sha256sums=('25d6a819bc90474a35ceb66ceefdc8acc24a039d02e5352d46d0f740e2bec4dc')

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
