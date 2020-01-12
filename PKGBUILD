# Maintainer: Jeff Henson <jeff@henson.io>

pkgname=plex-media-player-git
pkgver=r1306.11b21f5
pkgrel=1
pkgdesc='Next generation Plex Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/plexinc/plex-media-player'
provides=('plex-media-player')
conflicts=('plex-media-player')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine-595' 'qt5-x11extras-595' 'qt5-quickcontrols-595')
makedepends=('cmake' 'git')
source=('git+https://github.com/plexinc/plex-media-player.git')
sha256sums=('SKIP')

pkgver() {
  cd plex-media-player
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "${srcdir}/plex-media-player/build"
}

build() {
  cd "${srcdir}/plex-media-player/build"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE='Release' -DCMAKE_SKIP_RPATH=1 \
        -DQTROOT='/opt/qt595' ..
  make
}

package() {
  cd "${srcdir}/plex-media-player/build"
  DESTDIR="${pkgdir}" make install
}
