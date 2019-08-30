# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hans Janssen <janserv@gmail.com>
# Contributor: my64 <packages@obordes.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=openscenegraph
pkgver=3.6.4
pkgrel=1
pkgdesc='Open Source, high performance real-time graphics toolkit'
url='http://www.openscenegraph.org'
arch=('x86_64')
license=('custom:OSGPL')
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth')
makedepends=('cmake' 'libvncserver' 'qt5-base' 'ffmpeg' 'mesa')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib' 'qt5-base' 'ffmpeg')
conflicts=('openthreads')
provides=('openthreads')
source=(https://github.com/openscenegraph/OpenSceneGraph/archive/OpenSceneGraph-${pkgver}.tar.gz)
sha256sums=('81394d1b484c631028b85d21c5535280c21bbd911cb058e8746c87e93e7b9d33')
sha512sums=('7cb34fc279ba62a7d7177d3f065f845c28255688bd29026ffb305346e1bb2e515a22144df233e8a7246ed392044ee3e8b74e51bf655282d33ab27dcaf12f4b19')

build() {
  mkdir -p OpenSceneGraph-OpenSceneGraph-${pkgver}/build
  cd OpenSceneGraph-OpenSceneGraph-${pkgver}/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
  ..
  make
}

package() {
  cd OpenSceneGraph-OpenSceneGraph-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
