# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgbase=deadbeef-plugin-musical-spectrum-git
pkgname=(deadbeef-plugin-musical-spectrum-gtk2-git deadbeef-plugin-musical-spectrum-gtk3-git)
pkgver=r143
pkgrel=1
_pkgdesc="Musical Spectrum Plugin for the DeaDBeeF audio player (development version)."
url="https://github.com/cboxdoerfer/ddb_musical_spectrum"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git' 'pkg-config' 'deadbeef' 'fftw' 'gtk2' 'gtk3')

_gitname=ddb_musical_spectrum
_gitroot=https://github.com/cboxdoerfer/${_gitname}

source=("git+${_gitroot}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r""$(git rev-list --count HEAD)"
}

build() {
  cd "${_gitname}"

  touch AUTHORS
  touch ChangeLog

  make
}

package_deadbeef-plugin-musical-spectrum-gtk2-git() {
  pkgdesc="${_pkgdesc} GTK2 version."
  depends=('deadbeef' 'fftw' 'gtk2')
  provides=('deadbeef-plugin-musical-spectrum-gtk2')
  conflicts=('deadbeef-plugin-musical-spectrum-gtk2')
  install -D -v -c "${srcdir}/${_gitname}/gtk2/ddb_vis_musical_spectrum_GTK2.so" "${pkgdir}/usr/lib/deadbeef/ddb_vis_musical_spectrum_GTK2.so"
}
package_deadbeef-plugin-musical-spectrum-gtk3-git() {
  pkgdesc="${_pkgdesc} GTK3 version."
  depends=('deadbeef' 'fftw' 'gtk3')
  provides=('deadbeef-plugin-musical-spectrum-gtk3')
  conflicts=('deadbeef-plugin-musical-spectrum-gtk3')
  install -D -v -c "${srcdir}/${_gitname}/gtk3/ddb_vis_musical_spectrum_GTK3.so" "${pkgdir}/usr/lib/deadbeef/ddb_vis_musical_spectrum_GTK3.so"
}
