# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lime-git
_pkgname=lime
pkgver=4.4.0.alpha.r1.gfbdc8e6
pkgrel=1
pkgdesc="C++ library implementing Open Whisper System Signal protocol"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('lime')
provides=("lime=$pkgver")
depends=('bctoolbox>=4.3' 'soci>=4.0.0')
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
      -DENABLE_STATIC="NO" \
      -DENABLE_UNIT_TESTS=NO "../$_pkgname"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
