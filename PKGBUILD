pkgbase=deadbeef-plugin-playback-order-git
pkgname=(deadbeef-plugin-playback-order-gtk2-git deadbeef-plugin-playback-order-gtk3-git)
pkgver=r2
pkgrel=1
_pkgdesc="A plugin for the DeaDBeeF audio player which displays a combobox to select different playback orders (development version)."
url="https://github.com/cboxdoerfer/ddb_playback_order"
arch=('i686' 'x86_64')
license='GPL2'
makedepends=('git' 'pkg-config' 'deadbeef' 'gtk2' 'gtk3')

_gitname=ddb_playback_order
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

package_deadbeef-plugin-playback-order-gtk2-git() {
  pkgdesc=$_pkgdesc" GTK2 Ver."
  depends=('deadbeef' 'gtk2')
  provides=deadbeef-plugin-playback-order-gtk2
  conflicts=deadbeef-plugin-playback-order-gtk2
  install -D -v -c $srcdir/$_gitname/gtk2/ddb_misc_playback_order_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_misc_playback_order_GTK2.so
}
package_deadbeef-plugin-playback-order-gtk3-git() {
  pkgdesc=$_pkgdesc" GTK3 Ver."
  depends=('deadbeef' 'gtk3')
  provides=deadbeef-plugin-playback-order-gtk3
  conflicts=deadbeef-plugin-playback-order-gtk3
  install -D -v -c $srcdir/$_gitname/gtk3/ddb_misc_playback_order_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_misc_playback_order_GTK3.so
}
