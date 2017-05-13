# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-fastparquet')
_module='fastparquet'
pkgver='0.0.6'
pkgrel=1
pkgdesc="A python implementation of the parquet format."
url="https://github.com/dask/fastparquet"
checkdepends=('python-pytest')
depends=('python' 'python-numba'
    'python-numpy'
    'python-thriftpy')
makedepends=('cython' 'python-setuptools')
optdepends=('python-snappy'
    'python-lzo'
    'python-brotli')
license=('Apache')
arch=('i686' 'x86_64')
source=("https://github.com/dask/fastparquet/archive/$pkgver.tar.gz")
sha256sums=('6c8be537b947e28514052a52c6af572ca56dacc7a269ccfac62a6d06955e6352')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build_ext --inplace
    pytest
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
