# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=openspades
pkgver=0.1.0
pkgrel=2
pkgdesc="A clone of Voxlap Ace of Spades 0.75"
arch=('i686' 'x86_64')
url="http://openspades.yvt.jp/"
license=('GPL3')
depends=('curl' 'desktop-file-utils' 'glew' 'hicolor-icon-theme' 'mesa' 'openal' 'sdl2' 'sdl2_image')
makedepends=('cmake' 'wget' 'unzip')
install=openspades.install
source=("${pkgname}-v${pkgver}.tar.gz"::"https://github.com/yvt/openspades/archive/v${pkgver}.tar.gz")
md5sums=('a13cc11f0903c26e95df16370781e4c8')


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

