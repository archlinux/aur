# Maintainer: Oystein Sture <oysstu@gmail.com>
# Contributor: 

pkgname=python-gpy
pkgver=1.9.2
pkgrel=3
pkgdesc="Gaussian processes framework in python"
arch=("any")
license=("BSD")
url="https://github.com/SheffieldML/GPy"
depends=('python' 'python-numpy' 'python-scipy' 'python-six' 'python-paramz' 'python-matplotlib' 'python-climin-git')
optdepends=('python-plotly' 'ipython' 'python-sphinx' 'python-ipykernel' 'python-ipywidgets' 'python-jupyter_client' 'jupyter-notebook' 'python-mpi4py')
makedepends=('python-setuptools' 'python-numpy' 'cython')
source=("https://github.com/SheffieldML/GPy/archive/v${pkgver}.tar.gz")
sha512sums=("50dc3627a05b9fc2fbc61204cf492e89d5c067da7aca3e738c52cc3c06652aa825e27e66b0a14a2e67e074cd19a75ab564449a762f1de1ba27a02fc986432403")

prepare() {
    cd "GPy-${pkgver}"
    
    # Forcibly update cython for python 3.7 (https://github.com/SheffieldML/GPy/issues/649)
    find . -name '*.pyx' -exec cython {} \;
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
