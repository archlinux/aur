# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.0.24
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
sha256sums=('d6682f55039316615f640c73b4c4ef51aabae7a568314f0b4ed18d30f5377ea0')

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
