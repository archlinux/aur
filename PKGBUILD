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
pkgver=5.1
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
conflicts=('deoplete-git')
replaces=('')
backup=()
options=()
install="${_name}.install"
source=("$_name-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz")
noextract=()
sha512sums=('2b4f837ad7b09aba61644b3599d94e9d3cd87b354e46a6b685aec88b3b362c733b9f100eb863405beb70f22a0493956deff1c2dba96d5c4fa1765e65ef948844')

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
