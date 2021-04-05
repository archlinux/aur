# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player-git
pkgver=r1373.cbd48ec
pkgrel=1
pkgdesc='Next generation jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/iwalton3/jellyfin-media-player'
provides=('jellyfin-media-player')
conflicts=('jellyfin-media-player')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git')
source=('git+https://github.com/iwalton3/jellyfin-media-player.git'
        'https://github.com/iwalton3/jellyfin-web-jmp/releases/download/v1.1.0/dist.zip')
sha256sums=('SKIP'
            'd2f5e7b3fbe44307dafd99b5212cf11e0c01f780e27211cdf3acb9753d03f0bf')

pkgver() {
  cd jellyfin-media-player
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/jellyfin-media-player"
  mkdir -p build
  cd build
  cp -r "${srcdir}/dist" .
  cmake -DCMAKE_INSTALL_PREFIX='/usr/' -DCMAKE_BUILD_TYPE='Debug' -DQTROOT=./qt -DCMAKE_SKIP_RPATH=1 ..
  make
}

package() {
  cd "${srcdir}/jellyfin-media-player/build"
  DESTDIR="${pkgdir}" make install
}
