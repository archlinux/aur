# Maintainer: Qu Wenruo <wqu@suse.de>

_pkgname=vim-minimap
pkgname=${_pkgname}-git
pkgrel=1
pkgver="0.58.1bc36a0ff307"
pkgdesc='A code minimap for Vim'
arch=('any')
url="https://github.com/severin-lemaignan/${_pkgname}"
license=('MIT')
makedepends=('git')
depends=('vim' 'python')
groups=('vim-plugins')
source=("git+https://github.com/severin-lemaignan/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  install -d "${pkgdir}/usr/share/vim/vimfiles/"

  cd ${srcdir}/${_pkgname}

  rm -rf autoload/drawille/docs/
  rm -rf autoload/drawille/examples
  rm -rf autoload/drawille/README.md

  cp -dpr --no-preserve=ownership autoload "${pkgdir}/usr/share/vim/vimfiles/autoload"
  cp -dpr --no-preserve=ownership plugin "${pkgdir}/usr/share/vim/vimfiles/plugin"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

