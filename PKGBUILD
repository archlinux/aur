# Maintainer : Andres Urquijo <alfagalileox@gmail.com>

pkgname=mathgl
pkgver=2.3.5
pkgrel=1
pkgdesc="A library for making high-quality scientific graphics"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net"
license=('GPL3')
depends=('libpng' 'libharu' 'python2' 'hdf5' 'texlive-bin' 'texlive-core' 'python2-numpy' 
        'freeglut' 'gsl' 'wxgtk' 'qt5-base' )
makedepends=( 'cmake' 'swig')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}%20${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('7eb03b533e877be22d24f46800b712b4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -Denable-double=ON \
           -Denable-json=ON \
           -Denable-json-sample=ON \
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
           -Denable-octave=ON \
           -Denable-wx=ON \
           -Denable-qt5=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
