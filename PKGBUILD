# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=pteros
pkgver=2.7
pkgrel=1
pkgdesc="C++ library for molecular modeling."
arch=('any')
url='https://github.com/yesint/pteros'
license=('Artistic License 2.0')
depends=('pybind11' 'boost' 'eigen')
makedepends=('cmake' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname}"'::git+https://github.com/yesint/pteros.git#branch=master')
sha1sums=('SKIP')

build() {
    cd "$srcdir/${pkgname}"
    git checkout tags/v${pkgver}-stable
    mkdir -p build && pushd build
    cmake ..
    make
    popd
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install 
}
 
pkgver() {
  cd "$srcdir/${pkgname}"
  git tag --sort=-creatordate | grep 'stable' | head -n1 | sed 's/-stable//g; s/^v//g'
}
