pkgbase=deadbeef-plugin-playback-status-git
pkgname=(deadbeef-plugin-playback-status-gtk2-git deadbeef-plugin-playback-status-gtk3-git)
pkgver=r5
pkgrel=1
_pkgdesc="Playback Status Widget for the DeaDBeeF Audio Player  (development version)."
url="https://github.com/cboxdoerfer/ddb_playback_status"
arch=('i686' 'x86_64')
license='GPL2'
makedepends=('git' 'pkg-config' 'deadbeef' 'gtk2' 'gtk3')

_gitname=ddb_playback_status
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

package_deadbeef-plugin-playback-status-gtk2-git() {
  pkgdesc=$_pkgdesc" GTK2 Ver."
  depends=('deadbeef' 'gtk2')
  provides=deadbeef-plugin-playback-status-gtk2
  conflicts=deadbeef-plugin-playback-status-gtk2
  install -D -v -c $srcdir/$_gitname/gtk2/ddb_misc_playback_status_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_misc_playback_status_GTK2.so
}
package_deadbeef-plugin-playback-status-gtk3-git() {
  pkgdesc=$_pkgdesc" GTK3 Ver."
  depends=('deadbeef' 'gtk3')
  provides=deadbeef-plugin-playback-status-gtk3
  conflicts=deadbeef-plugin-playback-status-gtk3
  install -D -v -c $srcdir/$_gitname/gtk3/ddb_misc_playback_status_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_misc_playback_status_GTK3.so
}
