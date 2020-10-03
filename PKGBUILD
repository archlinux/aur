# Maintainer: Isho Antar <isho.antar1@gmail.com>
# Contributor: Michael Yang <ohmyarchlinux@pm.me>

pkgname=fmt-git
pkgver=7.0.3.a581e9e
pkgrel=1
pkgdesc='An open-source formatting library for C++'
url='https://fmt.dev/'
arch=('x86_64')
license=('MIT')
makedepends=('git' 'cmake>=3.1.0')
conflicts=('fmt')
provides=('fmt')
source=('git+https://github.com/fmtlib/fmt.git')
sha512sums=('SKIP')

pkgver() {
  cd fmt
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../fmt \
    -DFMT_DOC=OFF \
    -DBUILD_SHARED_LIBS=TRUE \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

check() {
  cd build
  make test
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 fmt/LICENSE.rst "${pkgdir}"/usr/share/licenses/fmt-git/LICENSE.rst
}
