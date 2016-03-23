# Maintainer : Andres Urquijo <alfagalileox@gmail.com>

pkgname=mathgl
pkgver=2.3.4
pkgrel=1
pkgdesc="A library for making high-quality scientific graphics"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net"
license=('GPL3')
depends=('libpng' 'libgl' 'libharu' 'python2' 'hdf5' 'texlive-bin' 'texlive-core' 'python2-numpy' 'freeglut')
makedepends=( 'cmake' 'swig')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}%20${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('64c804690e82570cc05b89df9e7c39d4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -Denable-double=ON \
           -Denable-json=ON \
           -Denable-json-sample=OFF \
           -Denable-mgltex=ON \
           -Denable-opengl=ON \
           -Denable-doc-pdf-en=OFF \
           -Denable-all-docs=OFF \
           -Denable-gif=ON \
           -Denable-glut=ON \
           -Denable-hdf5=ON \
           -Denable-jpeg=ON \
           -Denable-mgl2=ON \
           -Denable-gsl=ON \
           -Denable-pdf=ON \
           -Denable-png=ON \
           -Denable-python=ON \
           -Denable-wx=ON \
           -Denable-qt5=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
