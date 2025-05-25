# Maintainer: Gregory Land <landjgregory at gmail dot com>
pkgname=python-google-earthengine-api
_name=${pkgname#python-}
pkgver=1.5.15
pkgrel=1
pkgdesc="Python client libraries for calling the Google Earth Engine API."
arch=('any')
url="https://github.com/google/earthengine-api"
license=('APACHE')
depends=(
#       'google-cloud-sdk'
         'python-google-api-python-client'
         'python-google-cloud-storage'
         'python-google-auth'
         'python-google-auth-httplib2'
         'python-httplib2'
         'python-requests'
         'python-absl'
         'python-geopandas'
         'python-numpy'
        )
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-tensorflow')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("$_name-$pkgver.tar.gz::https://github.com/google/earthengine-api/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2472aba28527b3ac1579f425501c6fdcad29e4b3ef99416dec2c9b57f0af4251a84431097dd6b77742f5fc9b9d4a6446626706ee2632442890228157ac5a8fcf')

build() {
  cd "earthengine-api-$pkgver/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "earthengine-api-$pkgver/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

#check(){
#  cd "earthengine-api-$pkgver/python/"
#  python -m pytest ee/tests
#}
