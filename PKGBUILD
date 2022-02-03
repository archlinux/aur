# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.0.23
pkgrel=1
pkgdesc="A performant NumPy extension for Galois fields and their applications"
arch=('x86_64')
url="https://github.com/mhostetter/galois"
license=('MIT')
depends=(
    'python-numpy'
    'python-numba'
    'python-typing_extensions'
)
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("${_name}-${pkgver}.tar.gz::https://github.com/mhostetter/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf07fccbfd6140a9b7dcda901d305512fcfe4bea822ce08d9117e0601bd6b18e')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

check() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m pytest tests/
}
