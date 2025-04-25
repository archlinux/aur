# Maintainer: Gregory Land <landjgregory at gmail dot com>
pkgname=python-google-earthengine-api
_name=${pkgname#python-}
pkgver=1.5.12
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
sha512sums=('7cd63c1b6119500c818525f371f7a3ba83d6bde9bf409fb055342c463ba2fdafbe5fe4280a046cbe54a5f59aba9c49f7c6253754981ff26c136428b14368046e')

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
