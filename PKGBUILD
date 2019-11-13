# Maintainer: Josh Hoffer 
pkgname=madagascar
pkgver=3.0.1
pkgrel=1
pkgdesc="Automatic Rule-Based Time Tracker"
url=http://ahay.org/
license=('GPL2')
arch=('i686' 'x86_64')
depends=('libtirpc' 'ffmpeg' 'libxaw' 'cario' 'fftw' 'netpbm' 'gd'
'openmpi' 'glu' 'freeglut' 'suitesparse' 'python') 
makedepends=('scons' 'libtirpc' 'libtirpc-compat')
options=('strip')
source=("$pkgname.tar.gz::https://sourceforge.net/projects/rsf/files/madagascar/madagascar-3.0/madagascar-3.0.1.tar.gz/download")
noextract=("$pkgname.tar.gz")

prepare() {
	cd "$srcdir"
	bsdtar -xf $pkgname.tar.gz --strip-components=1
}

build() {
  cd ${srcdir}
  # Investigate additional bindings
  export LINKFLAGS="-ltirpc"
  ./configure --prefix=${pkgdir}/usr/
  sed -i "s/^LINKFLAGS.*/LINKFLAGS = ['-pthread', '-fopenmp', '-ltirpc']/g" config.py
  make
}

package() {
    make install
}
md5sums=('a87a6f7f5ba552cd251b1588048844bf')
