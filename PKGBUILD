# Maintainer  : Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor : Firef0x <firefgx { at } gmail { dot } com>

pkgname=vim-pkgbuild
pkgver=0.1.20141125.ca8e436
pkgrel=1
pkgdesc="Vim plugin to help editing and working with PKGBUILD files"
arch=('any')
url="https://github.com/Firef0x/PKGBUILD.vim"
license=('GPL')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
optdepends=('pkgbuild-introspection: for generating .AURINFO files and PKGBUILD data extraction')
install=vimdoc.install
source=("${pkgname}"::'git://github.com/Firef0x/PKGBUILD.vim.git')
md5sums=('SKIP')

pkgver()
{
  cd "$pkgname"
  ( set -o pipefail
  printf "0.1.%s.%s" "$(git log -1 --pretty=format:%cd --date=short | sed 's/-//g')" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd ${pkgname}

  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -D -m644 after/syntax/PKGBUILD.vim "$installpath/after/syntax/PKGBUILD.vim"
  install -D -m644 ftdetect/PKGBUILD.vim "$installpath/ftdetect/PKGBUILD.vim"
  install -D -m644 ftplugin/PKGBUILD.vim "$installpath/ftplugin/PKGBUILD.vim"
  install -D -m644 indent/PKGBUILD.vim "$installpath/indent/PKGBUILD.vim"
  install -D -m644 plugin/PKGBUILD.vim "$installpath/plugin/PKGBUILD.vim"
  install -D -m644 syntax/PKGINFO.vim "$installpath/syntax/PKGINFO.vim"

  install -d -m755 "$installpath/templates"
  install -D -m644 templates/* "$installpath/templates/"
}

# vim:set ts=2 sw=2 et:

