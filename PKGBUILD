# Original Author: Johannes Sauer <joh.sauer(at)gmail(dot)com>
# Maintainer: Danilo Bargen <aur at dbrgn dot ch>

name=cloudcompare
pkgname=${name}-git
pkgver=2.8.0.r112.g26401405
pkgrel=1
pkgdesc="A 3D point cloud (and triangular mesh) processing software"
arch=('i686' 'x86_64')
url="http://www.danielgm.net/cc/"
license=('GPL2')
depends=('qt5-base' 'glu' 'mesa')
makedepends=('git' 'cmake' 'pcl' 'doxygen' 'liblas')
optdepends=('pcl' 'liblas')
source=("${name}::git+https://github.com/CloudCompare/CloudCompare.git")
md5sums=('SKIP') 


pkgver() {
  cd ${srcdir}/${name}
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${name}
  
  mkdir -p build && cd build
 
  cmake .. \
     	          -DCMAKE_BUILD_TYPE=Release \
		  -DCMAKE_INSTALL_PREFIX=/usr \
	          -DBUILD_QPCL_PLUGIN_DOCUMENTATION=ON \
	  	  -DINSTALL_QPCL_PLUGIN=ON \
		  -DINSTALL_QSRA_PLUGIN=OFF \
		  -DINSTALL_QPOISSON_RECON_PLUGIN=OFF \
		  -DINSTALL_QHPR_PLUGIN=OFF \
		  -DINSTALL_QRANSAC_SD_PLUGIN=OFF \
		  -DINSTALL_QKINECT_PLUGIN=OFF \
		  -DINSTALL_QBLUR_PLUGIN=OFF \
		  -DINSTALL_QEDL_PLUGIN=OFF \
		  -DINSTALL_QPCV_PLUGIN=OFF \
		  -DINSTALL_QDUMMY_PLUGIN=OFF \
		  -DINSTALL_QSSAO_PLUGIN=OFF \
                  -DOPTION_USE_LIBLAS=ON \
                  -DLIBLAS_INCLUDE_DIR=/usr/include/liblas/ \
                  -DLIBLAS_RELEASE_LIBRARY_FILE=/usr/lib/liblas.so
  make
}

package() {
  cd ${srcdir}/${name}/build
  make DESTDIR="$pkgdir/" install
}
# vim:set sw=2 ts=2 et:
