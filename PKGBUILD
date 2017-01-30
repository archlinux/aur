
# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgbase=deadbeef-plugin-waveform-git
pkgname=(deadbeef-plugin-waveform-gtk2-git deadbeef-plugin-waveform-gtk3-git)
pkgver=r158
pkgrel=1
_pkgdesc="Waveform Seekbar Plugin for the DeaDBeeF audio player (development version)"
url="https://github.com/cboxdoerfer/ddb_waveform_seekbar"
arch=('i686' 'x86_64')
license=('GPL2')

_gitname=ddb_waveform_seekbar
_gitroot=https://github.com/cboxdoerfer/${_gitname}

source=("git+${_gitroot}")
md5sums=('SKIP')

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

package_deadbeef-plugin-waveform-gtk2-git() {
  pkgdesc=$_pkgdesc". GTK2 Ver"
  depends=('deadbeef' 'sqlite' 'gtk2')
  conflicts=('deadbeef-plugin-waveform-gtk2')
  provides=('deadbeef-plugin-waveform-gtk2')
  
  install -D -v -c $srcdir/$_gitname/gtk2/ddb_misc_waveform_GTK2.so $pkgdir/usr/lib/deadbeef/ddb_misc_waveform_GTK2.so
}

package_deadbeef-plugin-waveform-gtk3-git() {
  pkgdesc=$_pkgdesc". GTK3 Ver"
  depends=('deadbeef' 'sqlite' 'gtk3')
  conflicts=('deadbeef-plugin-waveform-gtk3')
  provides=('deadbeef-plugin-waveform-gtk3')
  install -D -v -c $srcdir/$_gitname/gtk3/ddb_misc_waveform_GTK3.so $pkgdir/usr/lib/deadbeef/ddb_misc_waveform_GTK3.so
}

