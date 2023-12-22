# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-gpy
_name=GPy
pkgver=1.13.0
pkgrel=1
pkgdesc="Gaussian processes framework in python"
arch=("any")
license=("BSD")
url="https://github.com/SheffieldML/GPy"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-paramz' 'python-matplotlib' 'python-climin-git')
optdepends=('python-plotly' 'ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook' 'python-mpi4py')
makedepends=('python-setuptools' 'python-numpy' 'cython' 'python-build' 'python-installer' 'python-wheel')
source=("https://github.com/SheffieldML/GPy/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('eceb9559b1ec565c767aa422ac896a5a3422da7dda0b42629e69311212766920')

prepare() {
    cd "GPy-v.${pkgver}"
    
    # Forcibly update cython for python 3.7 (https://github.com/SheffieldML/GPy/issues/649)
    find . -name '*.pyx' -exec cython -v -3 {} \;
}

build() {
    cd "GPy-v.${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "GPy-v.${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-gpy/LICENSE"
}
