# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: jddolvin <jddolvin@atheist.com>
# Contributor: arriagga <ramon.arriaga@gmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=musique
pkgver=1.7
pkgrel=1
pkgdesc='A finely crafted music player'
arch=('x86_64')
url='https://flavio.tordini.org/musique'
_giturl='https://github.com/flaviotordini'
license=('GPL3')
depends=('phonon-qt5' 'taglib' 'mpv')
makedepends=('git' 'qt5-tools')
source=("git+${_giturl}/musique.git#tag=${pkgver}" "git+${_giturl}/http.git" "git+${_giturl}/idle.git" "git+${_giturl}/media.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  mkdir -p build
  mv http idle media $pkgname/lib/
  sed -i 's|#include "imagedownloader.h"|#include "../imagedownloader.h"|' $pkgname/src/model/artist.cpp
}

build() {
  cd build
  qmake-qt5 ../$pkgname PREFIX=/usr
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
}

