# Maintainer: Andres F. Urquijo <alfagalileox@gmail.com>
pkgname=xtensor-git
_pkgname=xtensor
pkgver=0.10.4.r6.74fbf4a
pkgrel=1
pkgdesc="xtensor is a C++ library meant for numerical analysis with multi-dimensional array expressions."
arch=("any")
url="http://quantstack.net/xtensor"
license=('unknown')
depends=('gcc')
makedepends=('git' 'cmake')
optdepends=(
    "python: Optional, for python bindings"
    "pybind11: Optional, for python bindings"
    )
source=('git+https://github.com/QuantStack/xtensor.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}
