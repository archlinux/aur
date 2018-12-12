# Maintainer: Trent Palmer trenttdually at gmail

###########################################################################################################
#                                          Build Options
###########################################################################################################
_vim="y"

_neovim="n"
###########################################################################################################

_name='vim-closetag'
pkgname="${_name}-git"
pkgver=r46.fbcd62b
pkgrel=1
pkgdesc="Auto close (X)HTML tags"
arch=('any')
url="https://github.com/alvan/vim-closetag"
license=('unknown')
groups=()
depends=()
optdepends=('vim' 'neovim')
makedepends=('git') 
provides=('vim-closetag')
conflicts=('vim-closetag')
replaces=()
backup=()
options=()
source=('git+https://github.com/alvan/vim-closetag')

noextract=()
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  if [ "$_neovim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/nvim/runtime"
    cp -r "${srcdir}/${_name}/plugin" \
      "$pkgdir/usr/share/nvim/runtime"
  fi

  if [ "$_vim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/vim/vimfiles"
    cp -r "${srcdir}/${_name}/plugin" \
      "$pkgdir/usr/share/vim/vimfiles"
  fi

    install -D -m644 "${srcdir}/${_name}/README.md" $pkgdir/usr/share/doc/$pkgname/README.md
    # install -D -m644 "${srcdir}/${_name}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
