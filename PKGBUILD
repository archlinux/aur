# Maintainer:  swalladge <samuel at swalladge dot id dot au>
# Contributor: Brottweiler <brott@oc.tc>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=openspades-git
_pkgname=openspades
pkgver=0.1.3.rc.510.g9c5ba847b045
pkgrel=1
pkgdesc="A clone of Voxlap Ace of Spades 0.75 (git version)"
arch=('i686' 'x86_64')
url="https://github.com/yvt/openspades"
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'glew' 'hicolor-icon-theme' 'mesa' 'openal' 'opusfile' 'sdl2' 'sdl2_image' 'xdg-utils')
makedepends=('cmake' 'git' 'unzip' 'wget' 'zip' 'imagemagick')
provides=('openspades')
conflicts=('openspades')
install=openspades.install
source=("$pkgname"::'git+https://github.com/yvt/openspades.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//' | sed 's/-/./g'
}

build() {
  cmake -B build -S "${pkgname}" \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_BUILD_TYPE=RelWithDebInfo \
        -D OPENSPADES_RESDIR=/usr/share/$_pkgname/Resources \
        -D OPENSPADES_INSTALL_RESOURCES=share/$_pkgname/Resources \
        -D OPENSPADES_INSTALL_BINARY=bin
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  rm -rf "${pkgdir}/usr/share/menu"
}
