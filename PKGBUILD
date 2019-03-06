# Maintainer: Shengyu Zhang <la@archlinuxcn.org>

pkgname=vim-lsp-git
_pkgname=vim-lsp
_pkgname2=async.vim
pkgver=0.352.0310241
pkgrel=2
pkgdesc='async language server protocol plugin for vim and neovim'
arch=('any')
url="https://github.com/prabirshrestha/${_pkgname}"
license=('MIT')
makedepends=('git')
depends=('vim')
optdepends=('cquery-git: libclang based C/C++ language server')
groups=('vim-plugins')
source=("git+https://github.com/prabirshrestha/${_pkgname}.git"
        "git+https://github.com/prabirshrestha/${_pkgname2}.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  install -d "${pkgdir}/usr/share/vim/vimfiles/"

  cd ${srcdir}/${_pkgname}

  cp -dpr --no-preserve=ownership doc "${pkgdir}/usr/share/vim/vimfiles/doc"
  cp -dpr --no-preserve=ownership autoload "${pkgdir}/usr/share/vim/vimfiles/autoload"
  cp -dpr --no-preserve=ownership ftplugin "${pkgdir}/usr/share/vim/vimfiles/ftplugin"
  cp -dpr --no-preserve=ownership plugin "${pkgdir}/usr/share/vim/vimfiles/plugin"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd ${srcdir}/${_pkgname2}

  cp -dpr --no-preserve=ownership autoload "${pkgdir}/usr/share/vim/vimfiles"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
