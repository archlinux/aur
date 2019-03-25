# Maintainer: Kevin Del Castillo R. <lans9831@gmail.com>

_pkgname=neovim
pkgname=neovim-nightly
pkgver=0.4.0
pkgrel=1
pkgdesc='Fork of Vim aiming to improve user experience, plugins, and GUIs - Nightly Build'
arch=('x86_64')
url='https://neovim.io'
license=('custom:neovim')
provides=("$_pkgname")
conflicts=("$_pkgname")
optdepends=('python2-neovim: for Python 2 plugin support, see :help python'
            'python-neovim: for Python 3 plugin support, see :help python'
            'xclip: for clipboard support, see :help clipboard'
            'xsel: for clipboard support, see :help clipboard')

source=('https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz')
sha512sums=('3a3c599c10d094ae7e7742e3330c2af996290ede5fc30e3e7017bc55716e0ff8ae6cb663cd6a63016b222d56d38e9716f7fa4b5efeed21535e46903fe8a635d8')
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
