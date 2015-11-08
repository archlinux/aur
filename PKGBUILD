pkgbase=deadbeef-plugin-quick-search-git
pkgname=(deadbeef-plugin-quick-search-gtk2-git deadbeef-plugin-quick-search-gtk3-git)
pkgver=r15
pkgrel=1
_pkgdesc="Quick playlist search bar plugin for the DeaDBeeF audio player (development version)"
url="https://github.com/cboxdoerfer/ddb_quick_search"
arch=('i686' 'x86_64')
license='GPL2'
makedepends=('git' 'pkg-config' 'deadbeef' 'gtk2' 'gtk3')

_gitname=ddb_quick_search
_gitroot=https://github.com/cboxdoerfer/${_gitname}

source=git+$_gitroot
md5sums=SKIP

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r""$(git rev-list --count HEAD)"
}

build() {
  cd $_gitname

  touch AUTHORS
  touch ChangeLog

  make
}

package_deadbeef-plugin-quick-search-gtk2-git() {
  pkgdesc=$_pkgdesc" GTK2 Ver."
  depends=('deadbeef' 'gtk2')
  provides=deadbeef-plugin-quick-search-gtk2
  conflicts=deadbeef-plugin-quick-search-gtk2
  install -D -v -c $srcdir/$_gitname/gtk2/ddb_misc_quick_search_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_misc_quick_search_GTK2.so
}
package_deadbeef-plugin-quick-search-gtk3-git() {
  pkgdesc=$_pkgdesc" GTK3 Ver."
  depends=('deadbeef' 'gtk3')
  provides=deadbeef-plugin-quick-search-gtk3
  conflicts=deadbeef-plugin-quick-search-gtk3
  install -D -v -c $srcdir/$_gitname/gtk3/ddb_misc_quick_search_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_misc_quick_search_GTK3.so
}

