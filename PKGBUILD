# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Julian Mehne <julian (dot) mehne (at) posteo (dot) de>
# Contributor: renyuneyun <renyuneyun (at) gmail (dot) com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.34.2
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
    'python-jupyter_packaging'
)
makedepends=('python-build' 'python-installer')
optdepends=('gnuplot: for making plots' 'jupyterlab: JupyterLab computational environment')
source=("https://github.com/Calysto/octave_kernel/archive/v${pkgver}.tar.gz")
sha256sums=('912f8581a582777614e23417332bab2975afbe26d9b6a5b80a6a8b15dfb7b3b1')

build() {
    cd "$srcdir"/$_name-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/$_name-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
