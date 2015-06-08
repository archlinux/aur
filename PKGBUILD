# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=avxsynth-git
pkgver=20150407.80dcb7e
pkgrel=1
pkgdesc="Linux Port of AviSynth. (Git version)"
arch=('i686' 'x86_64')
url="http://www.avxsynth.org"
license=('GPL2')
depends=('qt4' 'mplayer' 'log4cpp' 'pango' 'ffms2')
makedepends=('git' 'yasm' 'subversion' 'python2')
provides=('avxsynth')
conflicts=('avxsynth')
source=('git+https://github.com/avxsynth/avxsynth.git')
sha1sums=('SKIP')

pkgver() {
  cd avxsynth
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
  cd avxsynth
  autoreconf -if
}

build() {
  cd avxsynth
  ./configure --prefix=/usr --enable-silent-rules
  make
}

package() {
  make -C avxsynth DESTDIR="${pkgdir}" install
}
