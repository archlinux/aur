# Maintainer: Trent Palmer trenttdually at gmail

###########################################################################################################
#                                          Build Options
###########################################################################################################
_vim="y"

_neovim="n"
###########################################################################################################

_name='deoplete-ternjs'
pkgname="${_name}-git"
pkgver=r103.5405e84
pkgrel=1
pkgdesc="javascript add-on for deoplete completion plugin for neovim"
arch=('any')
url="https://github.com/carlitux/deoplete-ternjs"
license=('MIT')
groups=()
depends=('deoplete' 'nodejs-tern') # nodejs-tern is available in the aur
makedepends=('git') 
provides=('deoplete-ternjs')
conflicts=('deoplete-ternjs')
replaces=()
backup=()
options=()
source=('git+https://github.com/carlitux/deoplete-ternjs')              # deoplete-ternjs

noextract=()
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_name}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  if [ "$_neovim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/nvim/runtime"
    cp -r "${srcdir}/${_name}/"{plugin,rplugin,autoload} \
      "$pkgdir/usr/share/nvim/runtime"
  fi

  if [ "$_vim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/vim/vimfiles"
    cp -r "${srcdir}/${_name}/"{plugin,rplugin,autoload} \
      "$pkgdir/usr/share/vim/vimfiles"
  fi

    install -D -m644 "${srcdir}/${_name}/README.md" $pkgdir/usr/share/doc/$pkgname/README.md
    install -D -m644 "${srcdir}/${_name}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
