# Maintainer: Moritz Lipp <mlq@pwmt.org>

_pkgname=libaxolotl-c

pkgname=libaxolotl-c-git
pkgver=4c18674
pkgrel=1
pkgdesc="Axolotl C Library."
arch=('i686' 'x86_64')
url="https://github.com/WhisperSystems/libaxolotl-c"
license=('GPL')
depends=()
makedepends=('git' 'cmake')
checkdepends=('check' 'openssl')
conflicts=('libaxolotl-c')
provides=('libaxolotl-c')
source=("${_pkgname}::git+https://github.com/WhisperSystems/libaxolotl-c")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
# -DBUILD_TESTING=1 \
  make
}

# check() {
#   cd "$srcdir/$_pkgname/build"
#   ctest
# }

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$_pkgname"
  git describe --long --always | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

# vim:set ts=2 sw=2 et:
