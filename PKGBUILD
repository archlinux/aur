# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-gpy
_name=GPy
pkgver=1.14.2
pkgrel=1
pkgdesc="Gaussian processes framework in python"
arch=("any")
license=("BSD")
url="https://github.com/SheffieldML/GPy"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-paramz' 'python-matplotlib' 'python-climin-git')
optdepends=('python-plotly' 'ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook' 'python-mpi4py')
makedepends=('python-setuptools' 'python-numpy' 'cython' 'python-build' 'python-installer' 'python-wheel')
source=("https://github.com/SheffieldML/GPy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('760f205c0205c1ce14d2b27b64b83f1f01c63c856deea892fc54c624d0723617')

prepare() {
    cd "GPy-${pkgver}"
    
    # Forcibly update cython for python 3+ (https://github.com/SheffieldML/GPy/issues/649)
    find . -name '*.pyx' -exec cython -v -3 {} \;
}

build() {
    cd "GPy-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "GPy-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-gpy/LICENSE"
}
