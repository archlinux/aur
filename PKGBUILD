# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=qpiano-git
_pkgname=qpiano
pkgver=r1109.09d8f71
pkgrel=1
pkgdesc="MIDI file/player that teaches you how to play the piano"
url="https://github.com/glixx/QPiano/"
depends=('qt5-base' 'alsa-lib' 'ftgl' 'hicolor-icon-theme' 'desktop-file-utils' 'ttf-dejavu')
makedepends=('git' 'cmake')
conflicts=(qpiano)
license=('GPL3')
arch=('x86_64' 'i686')
arch=('any')
source=("${pkgname}"::'git+https://github.com/glixx/QPiano.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  cd translations
  for i in *.ts
  do
    lrelease "$i"
  done
} 
 

build() {
  install -d ${srcdir}/${pkgname}/build
  cd ${srcdir}/${pkgname}/build
  cmake ../src 
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=$pkgdir install -C build 
}

# vim:set ts=2 sw=2 et:
