# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgbase=deadbeef-plugin-spectrogram-git
pkgname=(deadbeef-plugin-spectrogram-gtk2-git deadbeef-plugin-spectrogram-gtk3-git)
pkgver=r25.8d1b371
pkgrel=1
_pkgdesc="Spectrogram plugin for DeaDBeeF audio player"
url="https://github.com/cboxdoerfer/ddb_spectrogram"
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git' 'pkg-config' 'deadbeef' 'fftw' 'gtk2'  'gtk3')

source=(git+"${url}")
sha512sums=('SKIP')

_gitname=("ddb_spectrogram")

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  make
}

package_deadbeef-plugin-spectrogram-gtk2-git() {
  pkgdesc="${_pkgdesc} GTK2"
  depends=('deadbeef' 'fftw' 'gtk2')
  provides=('deadbeef-plugin-spectrogram-gtk2')
  conflicts=('deadbeef-plugin-spectrogram-gtk2' 'deadbeef-plugin-spectrogram-git')
  install -D -v -c "${srcdir}/${_gitname}/gtk2/ddb_vis_spectrogram_GTK2.so" "${pkgdir}/usr/lib/deadbeef/ddb_vis_spectrogram_GTK2.so"
}
package_deadbeef-plugin-spectrogram-gtk3-git() {
  pkgdesc="${_pkgdesc} GTK3"
  depends=('deadbeef' 'fftw' 'gtk3')
  provides=('deadbeef-plugin-spectrogram-gtk3')
  conflicts=('deadbeef-plugin-spectrogram-gtk3' 'deadbeef-plugin-spectrogram-git')
  install -D -v -c "${srcdir}/${_gitname}/gtk3/ddb_vis_spectrogram_GTK3.so" "${pkgdir}/usr/lib/deadbeef/ddb_vis_spectrogram_GTK3.so"
}
