# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: Melody Myszkowska <melodyuwu at disroot dot org>

pkgname=openspades
pkgver=0.1.3
pkgrel=3
pkgdesc="A clone of Voxlap Ace of Spades 0.75"
arch=('i686' 'x86_64')
url="http://openspades.yvt.jp/"
license=('GPL-3.0-only')
depends=('curl' 'glibc' 'zlib' 'libglvnd' 'gcc-libs' 'glew' 'hicolor-icon-theme' 'mesa' 'openal' 'opusfile' 'sdl2' 'sdl2_image' 'xdg-utils' 'freetype2')
makedepends=('cmake3' 'git' 'imagemagick' 'unzip' 'wget' 'zip' 'desktop-file-utils')
install=openspades.install
source=("${pkgname}-v${pkgver}.tar.gz"::"https://github.com/yvt/openspades/archive/v${pkgver}.tar.gz")
sha256sums=('ecd7aaf568f80712d981ecdd7bf9e380221dc2c16e86d2e56a0ddda87432bea3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=RelWithDebInfo -D OPENSPADES_RESDIR=/usr/share/openspades/Resources -D OPENSPADES_INSTALL_RESOURCES=share/openspades/Resources -D OPENSPADES_INSTALL_BINARY=bin .
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/menu"
}
