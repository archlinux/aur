# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Julian Mehne <julian (dot) mehne (at) posteo (dot) de>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.35.1
pkgrel=1
pkgdesc="A Jupyter kernel for Octave"
arch=('any')
url="https://github.com/Calysto/octave_kernel"
license=('BSD')
depends=(
    'jupyter-metakernel'
    'octave'
    'python-ipykernel'
    'python-jupyter_client'
)
makedepends=(
    'python-build'
    'python-hatchling'
    'python-installer'
)
optdepends=(
    'gnuplot: for making plots'
    'jupyterlab: JupyterLab computational environment'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Calysto/octave_kernel/archive/v${pkgver}.tar.gz")
b2sums=('62700070fbad51cd3b27823ef1e6d2b5b0c563b4234a1318fb886e1473b3b0874a319ece85c7f31516ac95f5216858badbe7449ab6a24b337fa503e16f1c64ac')

build() {
    cd "$srcdir"/$_name-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/$_name-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
