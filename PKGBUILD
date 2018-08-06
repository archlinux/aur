# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-fastparquet')
_module='fastparquet'
pkgver='0.1.5'
pkgrel=2
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
source=("https://github.com/dask/fastparquet/archive/$pkgver.tar.gz"
    "zstandard-0.9.patch")
sha256sums=('017c9812cc0180d10e134557a29296a56b40b32bb63c62f44a781e818792bf29'
            '08f34d49dc91c308a910347c6d141630eefb73d9e13284c0ace9893a9c834b39')

prepare() {
   cd "${srcdir}"
   patch -p0 < ../zstandard-0.9.patch
}

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
