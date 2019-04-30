# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-fastparquet')
_module='fastparquet'
pkgver='0.3.1'
pkgrel=1
pkgdesc="A python implementation of the parquet format."
url="https://github.com/dask/fastparquet"
checkdepends=('python-pytest'
    'python-snappy'
    'python-lz4')
depends=('python' 'python-numba'
    'python-numpy'
    'python-thrift')
makedepends=('cython' 'python-setuptools')
optdepends=('python-snappy'
    'python-lz4'
    'python-lzo'
    'python-brotli'
    'python-zstandard')
license=('Apache')
arch=('x86_64')
source=("https://github.com/dask/fastparquet/archive/$pkgver.tar.gz")
sha256sums=('2edab6b9c2e395fb9162342c10fbecd929006c842ea8abfca802fd5550717da8')

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
