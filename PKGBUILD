# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=python-galois
_name=${pkgname#python-}
pkgver=0.0.28
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
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=('python-pytest')
source=("${_name}-${pkgver}.tar.gz::https://github.com/mhostetter/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed374bfde45fac376cd4a68e50d69497f10b26a9cabfa81560af8227db3e0e5d')

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
