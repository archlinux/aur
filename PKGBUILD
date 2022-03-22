# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.0.25
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
makedepends=('python-build' 'python-installer')
checkdepends=('python-pytest')
source=("${_name}-${pkgver}.tar.gz::https://github.com/mhostetter/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fcc998054d2176ac38910331371c99244e3b14320eeaeabcbd186c7553b51168')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

#check() {
#    cd "${srcdir}/${_name}-${pkgver}"
#    python -m pytest tests/
#}
