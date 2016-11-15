# Maintainer:  swalladge <swalladge at gmail dot com>
# Contributor: Brottweiler <brott@oc.tc>
# Contributor: kusakata <shohei atmark kusakata period com>

pkgname=openspades-git
_pkgname=openspades
pkgver=0.0.12.155.gb6d4a50
pkgrel=1
pkgdesc="A clone of Voxlap Ace of Spades 0.75 (git version)"
arch=('i686' 'x86_64')
url="https://github.com/yvt/openspades"
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'glew' 'hicolor-icon-theme' 'mesa' 'openal' 'sdl2' 'sdl2_image')
makedepends=('cmake' 'git' 'unzip' 'wget')
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
  cd "$pkgname"
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release \
        -D OPENSPADES_RESDIR=/usr/share/$_pkgname/Resources \
        -D OPENSPADES_INSTALL_RESOURCES=share/$_pkgname/Resources \
        -D OPENSPADES_INSTALL_BINARY=bin .
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/menu"
}
