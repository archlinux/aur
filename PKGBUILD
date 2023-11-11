#Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgdesc="Library for collision detection between two convex shapes. Git version."
url='http://libccd.danfis.cz/'
pkgname=libccd-git
pkgver=2.1.0.g7931e76
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=()
_dir=libccd
source=("$_dir::git+https://github.com/danfis/libccd.git")
md5sums=('SKIP')
provides=('libccd')
conflicts=('libccd')

pkgver() {
  cd "${srcdir}/${_dir}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/\1/;s/-/./g'
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake ${srcdir}/${_dir} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
