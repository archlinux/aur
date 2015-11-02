# Maintainer: Tomas Storck <storcktomas@gmail.com>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=neovim-symlinks
pkgver=1.0.1
pkgrel=3
pkgdesc="System-wide: Runs neovim if vi or vim is invoked."
arch=('any')
license=('MIT')
depends=('neovim')
provides=('vim' 'vi')
conflicts=('vim' 'vi' 'vi-vim-symlink')
source=('vimdiff')
md5sums=('8ca45b6b93e6dab571f542ef262093e4')
sha256sums=()

package() {
    install -dm755 "$pkgdir/usr/bin"

    # vim --> nvim
    _link_names=(edit ex rview rvim vedit vi view vim)
    for _link in "${_link_names[@]}";
    do
        ln -s nvim "$pkgdir/usr/bin/$_link"
    done

    # vimdiff --> nvim -d
    install -Dm755 "$srcdir/vimdiff" "$pkgdir/usr/bin/vimdiff"
}

