#!/hint/bash
# Maintainer: Michael Bolden Jnr / SM9(); <me@sm9.dev>

_pkgname=glaze
pkgname="${_pkgname}-git"
pkgver=v1.4.1.r14.da5dc36
pkgrel=1
pkgdesc="A High-Performance, In-Memory JSON and Interface Library for Modern C++"
arch=('any')
url="https://github.com/stephenberry/glaze"
license=('MIT')
makedepends=('git' 'cmake')
optdepends=('gcc' 'clang')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}" || exit
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/${_pkgname}" || exit
    mkdir -p build
    cd build || exit

    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd "$_pkgname/build" || exit
    make install
}
