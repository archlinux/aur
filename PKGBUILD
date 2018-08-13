# Maintainer: Trent Palmer trenttdually at gmail

###########################################################################################################
#                                          Build Options
###########################################################################################################
_vim="y"

# neovim in Arch Linux seems to load vim extensions from /usr/share/vim/vimfiles by
# default now, (or you can add 'set rtp^=/usr/share/vim/vimfiles/' to .vimrc)
# but in any event, you may not need or want to set _neovim="y"
_neovim="n"
###########################################################################################################

_name='deoplete'
pkgname="${_name}-git"
pkgver=4.0.r3.gdc86f96
pkgrel=1
pkgdesc="deoplete completion plugin for neovim"
arch=('any')
url="https://github.com/Shougo/deoplete.nvim"
license=('MIT')
groups=()
depends=('python-neovim')
optdepends=('vim: vim support' 
            'neovim: neovim support' 
            'nvim-yarp: vim support' 
            'vim-hug-neovim-rpc: vim support')
makedepends=('git') 
provides=('deoplete')
conflicts=('deoplete')
replaces=('')
backup=()
options=()
install="${_name}.install"
source=("${_name}::${url//https/git}")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  if [ "$_neovim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/nvim/runtime"
    cp -r "${srcdir}/${_name}/"{autoload,doc,plugin,rplugin} \
      "$pkgdir/usr/share/nvim/runtime"
  fi

  if [ "$_vim" = "y" ]; then
    mkdir -p "$pkgdir/usr/share/vim/vimfiles"
    cp -r "${srcdir}/${_name}/"{autoload,doc,plugin,rplugin} \
      "$pkgdir/usr/share/vim/vimfiles"
  fi

  install -D -m644 "${srcdir}/${_name}/README.md" $pkgdir/usr/share/doc/$pkgname/README.md
  install -D -m644 "${srcdir}/${_name}/LICENSE" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
