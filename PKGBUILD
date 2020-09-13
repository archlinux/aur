# Maintainer: la Fleur <lafleur at boum dot org>

pkgname=vim-gtk-recent-git
_pkgname=${pkgname%-git}
pkgver=r6.14086b5
pkgrel=1
pkgdesc="logs files opened in vim into GObject recent files"
arch=('i686' 'x86_64')
url="https://gitlab.gnome.org/lafleur/vim-gtk-recent"
license=('GPLv3')
depends=('vim' 'python-gobject')
provides=(${_pkgname})
conflicts=(${_pkgname})
groups=('vim-plugins')
#source=("$pkgname"::'https://gitlab.gnome.org/lafleur/vim-gtk-recent.git')
source=("${_pkgname}::git+https://gitlab.gnome.org/lafleur/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}/plugin"

  cd "${srcdir}/${_pkgname}"
  install -D -m644 "gtk-recent.vim" "${_installpath}/plugin/"
}

