# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
pkgname=cpplog-git
pkgver=20150430
pkgrel=1
pkgdesc="A simple, header-only, MIT-licensed C++ logging library."
arch=('i686' 'x86_64')
url="https://github.com/andrew-d/cpplog"
license=('MIT')
depends=('boost')
optdepends=()
makedepends=('git')
provides=('cpplog')
conflicts=('cpplog')

# Repository location
_gitroot="git+https://github.com/bchretien/cpplog.git"
_gitname="cpplog"

source=("${_gitname}"::${_gitroot})
md5sums=('SKIP')

# Build type
_buildtype="RelWithDebInfo"

# Build directory
_builddir="${_gitname}-build"

pkgver() {
    date +%Y%m%d
}

# Build the project
build() {
    # Create a build directory
    cd "${srcdir}"
    mkdir -p ${_builddir}
    cd "${_builddir}"

    # Run CMake in release
    cmake -DCMAKE_BUILD_TYPE="${_buildtype}" \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          "${srcdir}/${_gitname}"

    make --silent
}


# Create the package
package() {
    cd "${srcdir}/${_builddir}"

    make --silent DESTDIR="${pkgdir}/" install
}
