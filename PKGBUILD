# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-fastparquet'
_module='fastparquet'
pkgver='0.8.1'
pkgrel=1
pkgdesc="A python implementation of the parquet format."
url="https://github.com/dask/fastparquet"
checkdepends=('python-pytest')
depends=(python python-cramjam python-fsspec)
makedepends=('cython' 'python-setuptools')
optdepends=('python-s3fs')
license=('Apache')
arch=('x86_64')
source=("https://github.com/dask/fastparquet/archive/$pkgver.tar.gz")
sha256sums=('591e20b128da87e369aa23178a29f2aaff4e4e69feab845be7ea456b3213fc96')

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

check() {
    cd "${_module}-${pkgver}"
    python setup.py build_ext --inplace
    pytest
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
