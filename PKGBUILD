# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>

_pkgname=diplib
pkgname="${_pkgname}-git"
pkgver=r2125.dff4c397
pkgrel=1
pkgdesc='Quantitative Image Analysis in C++, MATLAB and Python'
arch=('x86_64')
url='http://www.diplib.org/'
license=('Apache')
depends=('freeglut' 'glfw' 'glew' 'pybind11')
makedepends=('cmake' 'git')
optdepends=('java-runtime=8: DIPjavaio'
            'python: PyDIP'
            'matlab: DIPimage'
            'doxygen: documentation'
            'pandoc: documentation'
            'pandoc-crossref: documentation'
            'texlive-bin: documentation')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/DIPlib/diplib.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p build
    cd build
    cmake \
        -DOpenGL_GL_PREFERENCE=GLVND \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ..
    make
}

check() {
    cd "${srcdir}/${_pkgname}/build"
    make check
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make DESTDIR="${pkgdir}" install
}
