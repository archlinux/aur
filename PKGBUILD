# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

# I *DO NOT* maintain the source repo.
_pkgname=vim-gotham
pkgname="${_pkgname}-git"
pkgver=1.4564469
pkgrel=1
pkgdesc='Gotham is a very dark vim colorscheme.'
arch=('any')
url="https://github.com/whatyouhide/$_pkgname.git"
license=('MIT')
depends=('vim')
optdepends=('vim-airline: For vim airline theme'
            'vim-lightline-git: For vim lightline theme')
source=("git+https://github.com/whatyouhide/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf '1.%s' "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    true
}

package() {
    install -D -m644 "$srcdir/$_pkgname/colors/gotham.vim" "$pkgdir/usr/share/vim/vim74/colors/gotham.vim"
    install -D -m644 "$srcdir/$_pkgname/colors/gotham256.vim" "$pkgdir/usr/share/vim/vim74/colors/gotham256.vim"

    if pacman -Qs '^vim-airline' > /dev/null; then
        install -D -m644 "$srcdir/$_pkgname/autoload/airline/themes/gotham.vim" "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/gotham.vim"
        install -D -m644 "$srcdir/$_pkgname/autoload/airline/themes/gotham256.vim" "$pkgdir/usr/share/vim/vimfiles/autoload/airline/themes/gotham256.vim"
    else
        printf 'Package "vim-airline" not found, not installing themes.\n'
    fi

    if pacman -Qs '^vim-lightline' > /dev/null; then
        install -D -m644 "$srcdir/$_pkgname/autoload/lightline/colorscheme/gotham.vim" "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/gotham.vim"
        install -D -m644 "$srcdir/$_pkgname/autoload/lightline/colorscheme/gotham256.vim" "$pkgdir/usr/share/vim/vimfiles/autoload/lightline/colorscheme/gotham256.vim"
    else
        printf 'Package "vim-lightline" not found, not installing themes.\n'
    fi
}

