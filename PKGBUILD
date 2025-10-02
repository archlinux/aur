# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-s3fs
_pkgname=s3fs
pkgver=2025.9.0
pkgrel=2
pkgdesc="A python file interface to S3."
arch=('any')
url="https://github.com/fsspec/s3fs"
license=('BSD')
depends=('python' 'python-aiobotocore' "python-fsspec=${pkgver}")
checkdepends=('python-dask' 'python-flask-cors' 'python-moto' 'python-pytest' 'python-pytest-asyncio' 'python-xarray' 'python-zarr')
optdepends=()
makedepends=(python-build python-installer python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fsspec/s3fs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c2bb2f79a904a68cf307849276c6b5ce944f9ecbb96972f3280a8681c77c212f')

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
