# Maintainer: Kevin Del Castillo <quebin31@gmail.com>

_pkgname=neovim
pkgname=neovim-nightly
epoch=1
pkgver=0.5.0+20200319
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs - Nightly Builds'
arch=('x86_64')
url='https://neovim.io'
license=('custom:neovim')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('python2-neovim: for Python 2 plugin support, see :help python'
            'python-neovim: for Python 3 plugin support, see :help python'
            'xclip: for clipboard support, see :help clipboard'
            'xsel: for clipboard support, see :help clipboard')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz")
sha512sums=(SKIP) 
install=neovim.install

check() {
  cd "${srcdir}/nvim-linux64"
  ./bin/nvim --version
  ./bin/nvim --headless -u NONE -i NONE -c ':quit'
}

package() {
  cd "${srcdir}/nvim-linux64"

  mkdir -p "${pkgdir}/usr/bin"

  cp -r share "${pkgdir}/usr/"
  install bin/nvim "${pkgdir}/usr/bin"

  # Make Arch vim packages work
  mkdir -p "${pkgdir}"/usr/share/vim
  echo "set runtimepath+=/usr/share/vim/vimfiles" > "${pkgdir}"/usr/share/nvim/sysinit.vim
}

# vim:set sw=2 sts=2 et:
