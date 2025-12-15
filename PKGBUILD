# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-desktop-git
pkgver=r1965.8895fe3
pkgrel=1
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-desktop'
provides=('jellyfin-desktop')
conflicts=('jellyfin-desktop')
depends=('mpv' 'mpvqt' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt6-webengine' 'qt6-declarative')
makedepends=('cmake' 'git' 'ninja')
source=('git+https://github.com/jellyfin/jellyfin-desktop.git')
sha256sums=('SKIP')

pkgver() {
  cd jellyfin-desktop
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/jellyfin-desktop"
  rm -rf build
  mkdir build
  cmake \
    -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr/' \
    -DCMAKE_SKIP_RPATH=1 \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${srcdir}/jellyfin-desktop"
  DESTDIR="${pkgdir}" cmake --install build
}
