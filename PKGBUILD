# DAE plugin maintainer: Guilhem Saurel <guilhem.saurel[at]laas.fr>
# Original source: https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/openscenegraph

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hans Janssen <janserv@gmail.com>
# Contributor: my64 <packages@obordes.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=openscenegraph-dae
pkgver=3.6.5
pkgrel=2
pkgdesc='Open Source, high performance real-time graphics toolkit'
url='http://www.openscenegraph.org'
arch=('x86_64')
license=('custom:OSGPL')
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl' 'pth')
makedepends=('cmake' 'libvncserver' 'qt5-base' 'ffmpeg' 'mesa')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib' 'qt5-base' 'ffmpeg')
source=(https://github.com/openscenegraph/OpenSceneGraph/archive/OpenSceneGraph-${pkgver}.tar.gz)
sha256sums=('aea196550f02974d6d09291c5d83b51ca6a03b3767e234a8c0e21322927d1e12')
sha512sums=('7002fa30a3bcf6551d2e1050b4ca75a3736013fd190e4f50953717406864da1952deb09f530bc8c5ddf6e4b90204baec7dbc283f497829846d46d561f66feb4b')

build() {
  mkdir -p OpenSceneGraph-OpenSceneGraph-${pkgver}/build
  cd OpenSceneGraph-OpenSceneGraph-${pkgver}/build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
  ..
  VERBOSE=1 make
}

package() {
  cd OpenSceneGraph-OpenSceneGraph-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}/usr/"
  rm -rf bin include lib/pkgconfig
  find lib -type f ! -name osgdb_dae.so -delete
  find lib -type l -delete
}

# vim: ts=2 sw=2 et:
