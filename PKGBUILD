# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-s3fs
_pkgname=s3fs
pkgver=2025.2.0
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
sha256sums=('cce5896decb09c75a0f5605793209c3a1dae91aa4bd5b9b4d2ff0526ffb2e256')

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
