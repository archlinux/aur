# Maintainer: Kino <cybaol292261 at 163 dot com>
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
# Contributor: Fabio Loli <loli_fabio@protonmail.com>
# Contributor: Yuxin Wu <ppwwyyxxc@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: hauptmech
# Contributor: figo.zhang
# Contributor: lubosz
# Contributor: ZiXiS

pkgname=pcl
pkgver=1.13.0
pkgrel=2
pkgdesc="A comprehensive open source library for n-D Point Clouds and 3D geometry processing"
arch=('x86_64' 'i686')
url='http://www.pointclouds.org'
license=('BSD')
depends=('boost' 'eigen' 'flann' 'vtk' 'libpcap' 'libpng' 'libusb' 'libx11')
optdepends=('cuda' 'openmp' 'openni2' 'qhull')
makedepends=('adios2' 'cgns' 'cli11' 'cmake' 'fmt' 'glew' 'gl2ps' 'libharu' 'liblas' 'libxcursor'
             'netcdf' 'openvr' 'ospray' 'pdal' 'python-mpi4py' 'qt5-base' 'utf8cpp')
source=("https://github.com/PointCloudLibrary/pcl/archive/${pkgname}-${pkgver}.tar.gz")

sha256sums=('b6f6769b84d3d8313e48278388b923e32cf519e6a27a4876c2170d587b33721d')

build() {
 # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ${srcdir}/pcl-pcl-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_QT="QT5" \
    -DCMAKE_CXX_STANDARD=14 \
    -DBUILD_surface_on_nurbs=ON \
    -DCUDA_HOST_COMPILER=/usr/bin/gcc

  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/pcl-pcl-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
