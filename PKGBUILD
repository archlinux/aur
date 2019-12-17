# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=belcard-git
_pkgname=belcard
pkgver=4.4.0.alpha.r1.g45b0a20
pkgrel=1
pkgdesc="A library for working with vCards"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('belcard')
provides=("belcard=$pkgver")
depends=('belr>=4.3')
makedepends=('cmake' 'git')
source=("git+https://github.com/BelledonneCommunications/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake -DCMAKE_PREFIX_PATH="/usr/lib" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC=NO "../$_pkgname"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
