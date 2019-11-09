# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bcunit-git
_pkgname=bcunit
pkgver=3.0.2.r11.g966505d
pkgrel=1
pkgdesc="A fork of CUnit, a C unit testing framework"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
depends=()
makedepends=('cmake' 'git')
provides=('bcunit')
conflicts=('bcunit')
source=("git+https://gitlab.linphone.org/BC/public/bcunit.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DENABLE_STATIC=NO \
        "../$_pkgname"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
