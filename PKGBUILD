# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-fastparquet'
_module='fastparquet'
pkgver='0.3.3'
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
sha256sums=('c13bb15375d97e1f5f5d71731a3e8739cae9de9fc446cdfaec135a2ae93c1cd4')

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
