# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgbase=deadbeef-plugin-waveform-git
pkgname=(deadbeef-plugin-waveform-gtk2-git deadbeef-plugin-waveform-gtk3-git)
pkgver=0.5.r89.g6c901d5
pkgrel=1
_pkgdesc="Waveform Seekbar plugin for DeaDBeeF audio player"
url="https://github.com/cboxdoerfer/ddb_waveform_seekbar"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git' 'gtk2' 'gtk3')

_gitname=ddb_waveform_seekbar
_gitroot=https://github.com/cboxdoerfer/${_gitname}

source=("git+${_gitroot}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "${_gitname}"
  make
}

package_deadbeef-plugin-waveform-gtk2-git() {
  pkgdesc="${_pkgdesc} GTK2"
  depends=('deadbeef' 'sqlite' 'gtk2')
  conflicts=('deadbeef-plugin-waveform-gtk2')
  provides=('deadbeef-plugin-waveform-gtk2')
  install -D -v -c "${srcdir}/${_gitname}/gtk2/ddb_misc_waveform_GTK2.so" "${pkgdir}/usr/lib/deadbeef/ddb_misc_waveform_GTK2.so"
}

package_deadbeef-plugin-waveform-gtk3-git() {
  pkgdesc=${_pkgdesc}" GTK3"
  depends=('deadbeef' 'sqlite' 'gtk3')
  conflicts=('deadbeef-plugin-waveform-gtk3')
  provides=('deadbeef-plugin-waveform-gtk3')
  install -D -v -c "${srcdir}/${_gitname}/gtk3/ddb_misc_waveform_GTK3.so" "${pkgdir}/usr/lib/deadbeef/ddb_misc_waveform_GTK3.so"
}
