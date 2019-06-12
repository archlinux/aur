# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lime-git
_pkgname=lime
pkgver=0.1.0.r53.g98234a8
pkgrel=1
pkgdesc="C++ library implementing Open Whisper System Signal protocol"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('lime')
provides=('lime')
depends=('bctoolbox' 'soci')
makedepends=('cmake' 'git')
source=("git+https://gitlab.linphone.org/BC/public/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake -DCMAKE_PREFIX_PATH="/usr" \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC="NO" "../$_pkgname"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
