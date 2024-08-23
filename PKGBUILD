# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-s3fs
_pkgname=s3fs
pkgver=2024.6.1
pkgrel=1
pkgdesc="A python file interface to S3."
arch=('any')
url="https://github.com/fsspec/s3fs"
license=('BSD')
depends=('python' 'python-aiobotocore' "python-fsspec=${pkgver}")
checkdepends=('python-dask' 'python-flask-cors' 'python-moto' 'python-pytest' 'python-xarray' 'python-zarr')
optdepends=()
makedepends=(python-build python-installer python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fsspec/s3fs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d92b2dce6ce5a3c07cc5b779b3fa5529539a350701b86e5c50e8046abf1cab0d')

build(){
  cd "$_pkgname-$pkgver"
  python -m build -wn
}

package(){
  cd "$_pkgname-$pkgver"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check(){
  cd "$_pkgname-$pkgver"
  pytest
}
# vim:ts=2:sw=2:et:
