# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>
pkgname=deadbeef-plugin-spectrogram-git
pkgver=r25.8d1b371
pkgrel=1
pkgdesc="Spectrogram Plugin for the DeaDBeeF audio player (development version)"
url="https://github.com/cboxdoerfer/ddb_spectrogram"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('deadbeef')
makedepends=('git')
conflicts=('deadbeef-plugin-spectrogram')
source=(git+"${url}")
sha512sums=('SKIP')
_reponame=("${url##*/}")

pkgver() {
  cd "${srcdir}/${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make -C "${srcdir}/${_reponame}"
}

package() {
  cd "${srcdir}/${_reponame}"
  install -d "${pkgdir}/usr/lib/deadbeef/"
  install -p gtk2/ddb_vis_spectrogram_GTK2.so gtk3/ddb_vis_spectrogram_GTK3.so "${pkgdir}/usr/lib/deadbeef"
}
