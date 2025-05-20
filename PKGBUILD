# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>

_name='h3-py'
pkgname=('python-h3')
pkgdesc="Hexagonal Hierarchical Geospatial Indexing System in Python"
pkgver=4.2.2
pkgrel=1
url="https://github.com/uber/${_name}"
license=('Apache')
arch=('any')
depends=('python' 'cython')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-scikit-build' 'cmake' 'flake8' 'python-cmake-build-extension' 'python-setuptools')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('fa30f048f3cd39496cdb745de49502993976b1e47eb6ddbe0f5ae6e560ac3ac9')

prepare() {
    cd "${srcdir}/${_name}"
    git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${_name}"
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
    cd "${srcdir}/${_name}/build"
    DESTDIR=$pkgdir make
    DESTDIR=$pkgdir make install
}
