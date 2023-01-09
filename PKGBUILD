# Maintainer: giskard <rtgiskard@gmail.com>

pkgbase=deadbeef-plugin-quicksearch-git
pkgname=(deadbeef-plugin-quicksearch-gtk2-git deadbeef-plugin-quicksearch-gtk3-git)
pkgver=r27.14fba1b
pkgrel=1
_pkgdesc="Quick Search Plugin for the DeaDBeeF audio player"
url="https://github.com/cboxdoerfer/ddb_quick_search"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git' 'pkg-config' 'deadbeef' 'gtk2' 'gtk3')

_gitname=ddb_quick_search
_gitroot=https://github.com/cboxdoerfer/${_gitname}

source=("git+${_gitroot}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  make
}

package_deadbeef-plugin-quicksearch-gtk2-git() {
  pkgdesc="${_pkgdesc} GTK2"
  depends=('deadbeef' 'gtk2')
  provides=('deadbeef-plugin-quicksearch-gtk2')
  conflicts=('deadbeef-plugin-quicksearch-gtk2')
  install -D -v -c "${srcdir}/${_gitname}/gtk2/ddb_misc_quick_search_GTK2.so" -t "${pkgdir}/usr/lib/deadbeef/"
}

package_deadbeef-plugin-quicksearch-gtk3-git() {
  pkgdesc="${_pkgdesc} GTK3"
  depends=('deadbeef' 'gtk3')
  provides=('deadbeef-plugin-quicksearch-gtk3')
  conflicts=('deadbeef-plugin-quicksearch-gtk3')
  install -D -v -c "${srcdir}/${_gitname}/gtk3/ddb_misc_quick_search_GTK3.so" -t "${pkgdir}/usr/lib/deadbeef/"
}
