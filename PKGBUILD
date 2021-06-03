# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-vimtex-git
pkgver=2.2.r10.g40a76277
pkgrel=1
pkgdesc='A modern Vim and neovim filetype plugin for LaTeX files'
arch=('any')
url="https://github.com/lervag/vimtex"
license=('MIT')
depends=('vim' 'texlive-core')
makedepends=('git')
provides=('vim-vimtex')
conflicts=('vim-vimtex')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/vimtex"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/vimtex"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -dvm755 "${_installpath}"
  cp -rvt "${_installpath}" after autoload compiler doc ftdetect ftplugin indent rplugin syntax
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
