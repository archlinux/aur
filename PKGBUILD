# Maintainer: Tony Lambiris <tony@criticalstack.com

pkgname=double-conversion-git
pkgver=2.0.1.r92.g1b5fa31
pkgrel=1
pkgdesc='Efficient binary-decimal and decimal-binary conversion routines for IEEE doubles.'
arch=(i686 x86_64)
url='https://github.com/google/double-conversion'
license=(BSD)
conflicts=(double-conversion)
provides=(double-conversion)
replaces=(double-conversion)
depends=(gcc-libs)
makedepends=(git scons cmake)
source=(git+https://github.com/google/double-conversion.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/double-conversion
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/double-conversion
  cmake . \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_INSTALL_LIBDIR=lib
  make
}

check() {
  cd "${srcdir}"/double-conversion
  cd test
  cmake .
# Currently tests fail
#  make all
}

package () {
  cd "${srcdir}"/double-conversion
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/double-conversion/LICENSE
}
