# Maintainer: Kino <cybao292261 at 163 dot com>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
# Contributor: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Yuxin Wu <ppwwyyxxc@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hauptmech
# Contributor: figo.zhang
# Contributor: lubosz
# Contributor: ZiXiS

pkgname=pcl
pkgver=1.14.0
pkgrel=1
pkgdesc="A comprehensive open source library for n-D Point Clouds and 3D geometry processing"
arch=('x86_64' 'i686')
url='https://www.pointclouds.org'
license=('BSD')
depends=('boost' 'eigen' 'flann' 'vtk' 'libpcap' 'libpng' 'libusb' 'libx11')
optdepends=('cuda' 'openmp' 'openni2' 'qhull')
makedepends=('adios2' 'cgns' 'cli11' 'cmake' 'fmt' 'glew' 'gl2ps' 'libharu' 'liblas' 'libxcursor'
             'netcdf' 'openvr' 'ospray' 'pdal' 'python-mpi4py' 'qt5-base' 'utf8cpp' 'verdict')
source=("https://github.com/PointCloudLibrary/pcl/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('de297b929eafcb93747f12f98a196efddf3d55e4edf1b6729018b436d5be594d')

build() {
  cmake -B build -S "${srcdir}/pcl-pcl-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_CXX_STANDARD=14 \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DWITH_QT='QT5' \
    -DBUILD_surface_on_nurbs=ON \
    -DCUDA_HOST_COMPILER='/usr/bin/gcc' \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 ${srcdir}/pcl-pcl-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
