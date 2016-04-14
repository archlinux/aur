# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=avxsynth-git
pkgname=('avxsynth-git' 'avxedit-git')
pkgver=20150407.80dcb7e
pkgrel=1
pkgdesc="Linux Port of AviSynth. (Git version)"
arch=('i686' 'x86_64')
url='http://www.avxsynth.org'
license=('GPL2')
makedepends=('git'
             'yasm'
             'subversion'
             'python2'
             'qt4'
             'mplayer'
             'log4cpp'
             'pango'
             'ffms2'
             )
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
  ./configure \
    --prefix=/usr \
    --enable-silent-rules \
    --disable-ffms2
  make
}

package_avxsynth-git() {
  pkgdesc="Linux Port of AviSynth. (Git version)"
  depends=('ffms2'
           'ffmpeg'
           'log4cpp'
           'pango'
           )
  provides=('avxsynth')
  conflicts=('avxsynth')

  make -C avxsynth DESTDIR="${pkgdir}" install
  make -C avxsynth/apps/AVXEdit DESTDIR="${pkgdir}" uninstall
}

package_avxedit-git() {
  pkgdesc="Simple Qt4 frontend for create/edit/test AvxSynth scripts. (Git version)"
  depends=('qt4'
           'avxsynth-git'
           )
  provides=('avxedit')
  conflicts=('avxedit')

  make -C avxsynth/apps/AVXEdit DESTDIR="${pkgdir}" install
}
