# Maintainer: Daniel Maslowski <info@orangecms.org>
pkgname=vim-dein-git
_gitname=dein.vim
pkgver=0.0.r363.gcf88cb0
pkgrel=2
pkgdesc="dark powered Vim/Neovim plugin manager"
arch=('any')
url="https://github.com/Shougo/dein.vim"
license=('MIT')
depends=()
optdepends=(
  'neovim:  use in nvim'
  'vim>=7.4: use in vim'
)
makedepends=('git')
install=vim-dein-git.install
source=("git+https://github.com/Shougo/dein.vim")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_gitname}"
  sharepath="${pkgdir}/usr/share"
  vimpath="${sharepath}/vim/vimfiles"
  # install to global Vim directory
  install -Dm 644 doc/dein.txt "${vimpath}/doc/dein.txt"
  cp -R autoload ${vimpath}
  # LICENSE and README
  install -Dm 644 LICENSE ${sharepath}/licenses/${pkgname}/LICENSE
  install -Dm 644 README.md ${sharepath}/doc/${pkgname}/README
}
