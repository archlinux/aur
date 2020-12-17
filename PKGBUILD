# Maintainer: J. Emiliano Deustua <edeustua@gmail.com>

pkgname=libecpint-git
_pkgname=libecpint
pkgver=v1.0.4.r0.g5731482
pkgrel=1
pkgdesc="A C++ library for the efficient evaluation of integrals over effective core potentials."
arch=('x86_64')
url="https://github.com/robashaw/libecpint"
license=('MIT')
makedepends=('git' 'gcc' 'doxygen' 'cmake')
provides=('libecpint')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake \
        -S "${_pkgname}" \
        -B "${_pkgname}/build" \
        -DCMAKE_CXX_FLAGS='-O3' \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr'
    make -C "${_pkgname}/build"
}

check() {
    make -C "${_pkgname}/build" test
}

package() {
  cd "${_pkgname}"
  make -C build DESTDIR="$pkgdir" install
}

