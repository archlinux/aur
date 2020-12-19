# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=lime-git
_pkgname=lime
pkgver=4.5.0.alpha.r13.g550515b
pkgrel=1
pkgdesc="C++ library implementing Open Whisper System Signal protocol"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('lime')
provides=("lime=$pkgver")
depends=('bctoolbox-git' 'soci>=4.0.0')
makedepends=('cmake' 'git')
source=("git+https://gitlab.linphone.org/BC/public/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build $_pkgname \
    -DCMAKE_PREFIX_PATH="/usr" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DENABLE_STATIC="NO" \
    -DENABLE_UNIT_TESTS=NO \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}
