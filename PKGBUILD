# Maintainer : Andres Urquijo <alfagalileox@gmail.com>
pkgname=mathgl
pkgver=2.4.2
pkgrel=1
pkgdesc="A library for making high-quality scientific graphics"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net"
license=('GPL3')
depends=('libpng' 'libharu' 'python2' 'hdf5' 'texlive-bin' 'texlive-core' 'python2-numpy' 
        'freeglut' 'gsl' 'wxgtk' 'qt5-base' )
makedepends=( 'cmake' 'swig')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname%20$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('49eb2436ba0eb5593961657677a18686')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -Denable-all-widgets=OFF \
           -Denable-double=ON \
           -Denable-mgltex=ON \
           -Denable-opengl=ON \
           -Denable-doc-info=ON \
           -Denable-doc-html=ON \
           -Denable-gif=ON \
           -Denable-glut=ON \
           -Denable-hdf5=ON \
           -Denable-jpeg=ON \
           -Denable-mgl2=ON \
           -Denable-gsl=ON \
           -Denable-pdf=ON \
           -Denable-png=ON \
           -Denable-qt5=ON \
           -Denable-python=ON
  
  make
  cp ../translations/mathgl_en.mo .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
