# Contributor : Andres Urquijo <alfagalileox@gmail.com>

pkgname=mathgl
pkgver=8.0.1
pkgrel=1
pkgdesc="A library for making high-quality scientific graphics"
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net"
license=('GPL3')
depends=('python-numpy' 'texlive-bin' 'texlive-binextra' 'libharu' 'hdf5' 'gsl' 'glu' 'qt5-base' 'libpng' 'freeglut')
makedepends=('cmake' 'swig')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname%208.0/$pkgname-$pkgver.tar.gz")
md5sums=('e86d414f180f7d3e3f1495aca7134409')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
      	[[ -d build ]] && rm -rf build
    	mkdir build && cd build

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
