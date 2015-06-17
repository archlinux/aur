# Maintainer: Tom Ingleby <tom@ewsting.org>
pkgname='mraa-git'
pkgver=0.7.2.7.ga44c585
pkgrel=0
pkgdesc="Low Level Skeleton Library for IO Communication on GNU/Linux platforms."
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
makedepends=('git' 'cmake' 'swig')
optdepends=('python: for Python support')
url="https://github.com/intel-iot-devkit/mraa"
license=('MIT')
arch=('x86_64' 'i686')

source=(git+https://github.com/intel-iot-devkit/mraa.git)
md5sums=('SKIP')

pkgver() {
  cd mraa
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/\1/;s/-/./g'
}

build() {
  mkdir -p mraa/build
  cd mraa/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILDSWIGNODE=off ../
  make
}

package() {
  cd $srcdir/mraa/build
  make DESTDIR="${pkgdir}/" install
}
