# Maintainer: Orell Garten <orell.garten at rub.de>
_pkgname=blazert
pkgname=blazert-git
provides=('blazert')
pkgver=20.2.1
pkgrel=1
pkgdesc='An open-source, high-performance C++ ray tracing kernel library (develop).'
url='https://github.com/cstatz/blazert'
arch=('any')
license=('BSD')
makedepends=('cmake' 'git' 'make' 'gcc' 'blas' 'lapack' 'blaze' 'tar')
sha256sums=('SKIP')
source=("git+${url}#branch=develop")
conflicts=('blazert')

pkver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd ${_pkgname} 
}

build() {
    cd $_pkgname
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
    cmake --build .
}

package() {
    cd ${_pkgname}/build
    make DESTDIR="$pkgdir/" install
}

