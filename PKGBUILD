# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Matthew Gamble
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=vim-csv-git
_pkgname=csv.vim
pkgver=r612.ece4fde
pkgrel=1
epoch=1
pkgdesc='csv.vim: a filetype plugin for csv files'
arch=('any')
url='https://github.com/chrisbra/csv.vim'
license=('unknown')
groups=('vim-plugins')
depends=('vim-plugin-runtime') # needs vim>=7.4
makedepends=('git')
source=("git+https://github.com/chrisbra/${_pkgname}.git")
sha256sums=('SKIP')
provides=('vim-csv')
conflicts=('vim-csv')

pkgver() {
  cd ${_pkgname}
  # No tags in the GitHub version
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${_pkgname}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -dm755 "${_installpath}"
  for _appdir in autoload doc ftdetect ftplugin plugin syntax; do
    cp -dpr --no-preserve=ownership $_appdir "${_installpath}/${_appdir}"
  done
}
