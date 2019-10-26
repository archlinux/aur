# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-gpy
_name=GPy
pkgver=1.9.9
pkgrel=1
pkgdesc="Gaussian processes framework in python"
arch=("any")
license=("BSD")
url="https://github.com/SheffieldML/GPy"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-paramz' 'python-matplotlib' 'python-climin-git')
optdepends=('python-plotly' 'ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook' 'python-mpi4py')
makedepends=('python-setuptools' 'python-numpy' 'cython')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=("04faf0c24eacc4dea60727c50a48a07ddf9b5751a3b73c382105e2a31657c7ed")

prepare() {
    cd "GPy-${pkgver}"
    
    # Forcibly update cython for python 3.7 (https://github.com/SheffieldML/GPy/issues/649)
    find . -name '*.pyx' -exec cython -v -3 {} \;
}

build() {
    cd "GPy-${pkgver}"
    python setup.py build
}

package() {
    cd "GPy-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-gpy/LICENSE"
}
