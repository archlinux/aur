# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-fastparquet')
_module='fastparquet'
pkgver='0.2.1'
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
sha256sums=('28aefffd7ea1c9d858095fe9093090867c74d73922de0bfd95bf84f88c8da62c')

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
