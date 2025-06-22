# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor:

pkgname=manif
pkgver=0.0.5
pkgrel=1
pkgdesc="A small C++11 header-only library for Lie theory."
arch=('i686' 'x86_64' 'aarch64')
license=("MIT")
url="https://github.com/artivis/manif"
depends=('eigen' 'tl-optional')
makedepends=('cmake' 'pybind11' 'python')
source=("https://github.com/artivis/manif/archive/${pkgver}.tar.gz")
sha256sums=('246a781c54a5c57179d48096faca0d108944e120f69d8fd7fb69e3cb4a0a67fb')

build() {
    cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DBUILD_PYTHON_BINDINGS:BOOL=ON \
        -DUSE_SYSTEM_WIDE_TL_OPTIONAL:BOOL=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
