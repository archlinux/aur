# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-s3fs
_pkgname=s3fs
pkgver=2024.3.1
pkgrel=1
pkgdesc="A python file interface to S3."
arch=('any')
url="https://github.com/fsspec/s3fs"
license=('BSD')
depends=('python' 'python-aiobotocore' "python-fsspec=${pkgver}")
checkdepends=('python-dask' 'python-flask-cors' 'python-moto' 'python-pytest' 'python-xarray' 'python-zarr')
optdepends=()
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/fsspec/s3fs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a73776b44b6d1bcb5875ec7be25adc298a9ae0a18d96b4ba3f4ac64d9817265b')

build(){
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package(){
  cd "$_pkgname-$pkgver"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

check(){
  cd "$_pkgname-$pkgver"
  pytest
}
# vim:ts=2:sw=2:et:
