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
pkgver=6.0
pkgrel=1
pkgdesc="deoplete completion plugin for neovim"
arch=('any')
url="https://github.com/Shougo/deoplete.nvim"
license=('MIT')
groups=()
depends=('python-pynvim')
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
sha512sums=('1dcb4a972e0d18fb10aeede84b7c7121c55588c57b7bd6454361f4feabf7a9e4c0fa268af8e77a6e8eed901530718d4270b62cb972d33503989b8ed57e6f0ae0')

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
