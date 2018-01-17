# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=openspades
pkgver=0.1.2
pkgrel=1
pkgdesc="A clone of Voxlap Ace of Spades 0.75"
arch=('i686' 'x86_64')
url="http://openspades.yvt.jp/"
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'glew' 'hicolor-icon-theme' 'mesa' 'openal' 'opusfile' 'sdl2' 'sdl2_image' 'xdg-utils')
makedepends=('cmake' 'git' 'imagemagick' 'unzip' 'wget' 'zip')
install=openspades.install
source=("${pkgname}-v${pkgver}.tar.gz"::"https://github.com/yvt/openspades/archive/v${pkgver}.tar.gz")
sha256sums=('f4947232eded073469d07935783786efd70e7d73e615326dbb66676c4e8724a8')



build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D OPENSPADES_RESDIR=/usr/share/openspades/Resources -D OPENSPADES_INSTALL_RESOURCES=share/openspades/Resources -D OPENSPADES_INSTALL_BINARY=bin .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/menu"
}

