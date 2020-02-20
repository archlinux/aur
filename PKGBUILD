# Maintainer: Trent Palmer trenttdually at gmail

###########################################################################################################
#                                          Build Options
###########################################################################################################
_vim="y"

# neovim can load plugins installed as vim plugins
_neovim="n"
###########################################################################################################

_name='deoplete'
pkgname="${_name}"
pkgver=5.2
pkgrel=1
pkgdesc="deoplete completion plugin for neovim"
arch=('any')
url="https://github.com/Shougo/deoplete.nvim"
license=('MIT')
groups=()
depends=('python-neovim' 'python-msgpack<1.0.0')
optdepends=('vim: vim support' 
            'neovim: neovim support' 
            'nvim-yarp: vim support' 
            'vim-hug-neovim-rpc: vim support')
makedepends=('git') 
provides=('deoplete')
conflicts=('deoplete-git')
replaces=('')
backup=()
options=()
install="${_name}.install"
source=("$_name-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
noextract=()
sha512sums=('9cb33db8d64e3021aabfd044d9ea42413b676e23c2014be00a2891240035f2db97e27968a99104c1d302d413bb6df5664e314075c78d2d4f62f08fcbf26bdfc0')

prepare() {
  mv "${pkgname}.nvim-${pkgver}" "${pkgname}"
}

package() {
  if [ "$_neovim" = "y" ]; then
    mkdir -p "${pkgdir}/usr/share/nvim/runtime"
    cp -r "${srcdir}/${_name}/"{autoload,doc,plugin,rplugin} \
      "${pkgdir}/usr/share/nvim/runtime"
  fi

  if [ "$_vim" = "y" ]; then
    mkdir -p "${pkgdir}/usr/share/vim/vimfiles"
    cp -r "${srcdir}/${_name}/"{autoload,doc,plugin,rplugin} \
      "${pkgdir}/usr/share/vim/vimfiles"
  fi

  install -D -m644 "${srcdir}/${_name}/README.md" $pkgdir/usr/share/doc/$pkgname/README.md
  install -D -m644 "${srcdir}/${_name}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
