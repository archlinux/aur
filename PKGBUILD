# Maintainer: Tom Ingleby <tom@ewsting.org>
pkgname='mraa'
pkgver=2.0.0
pkgrel=1
pkgdesc="Low Level Skeleton Library for IO Communication on GNU/Linux platforms."
makedepends=('git' 'cmake' 'swig')
depends=('json-c')
optdepends=('python: for Python support' 'python2: for Python2 support')
url="https://github.com/intel-iot-devkit/mraa"
license=('MIT')
arch=('x86_64' 'i686')

source=(git+https://github.com/intel-iot-devkit/mraa.git#tag=v$pkgver)
md5sums=('SKIP')

build() {
  mkdir -p mraa/build
  cd mraa/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DINSTALLTOOLS=on -DBUILDSWIGNODE=off \
	-DCMAKE_INSTALL_LIBDIR=/usr/lib ../
  make -j
}

package() {
  cd $srcdir/mraa/build
  make DESTDIR="${pkgdir}/" install
}
