 # Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=tweedledum
pkgname=python-${_pkgname}-git
pkgver=r260.e73beb23
pkgrel=2
pkgdesc="A library for synthesizing and manipulating quantum circuits"
arch=('x86_64')
url="https://github.com/boschmitt/tweedledum"
license=('MIT')
makedepends=(
    'cmake'
    'ninja'
    'nlohmann-json'
    'python-scikit-build'
    'python-setuptools'
)
provides=('python-tweedledum')
conflicts=('python-tweedledum')
source=("git+https://github.com/boschmitt/${_pkgname}.git")
sha256sums=('SKIP')


pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
