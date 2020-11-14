# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=pteros
pkgver=2.8.r125.g16923940
pkgrel=1
pkgdesc="C++ library for molecular modeling."
arch=('any')
url='https://github.com/yesint/pteros'
license=('Artistic License 2.0')
depends=('pybind11' 'boost' 'eigen' 'libfmt.so' 'libspdlog.so')
makedepends=('cmake' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname}"'::git+https://github.com/yesint/pteros.git#branch=master')
sha1sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"
    mkdir -p build && pushd build
    cmake -DWITH_OPENBABEL=OFF -DWITH_GROMACS=OFF -DDOWNLOAD_DEPS=OFF ..
    make
    popd
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install 
}
 
pkgver() {
  cd "$srcdir/${pkgname}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}
