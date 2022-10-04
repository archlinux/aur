# Maintainer: Gregory Land <landjgregory at gmail dot com>
pkgname=python-google-earthengine-api
_name=${pkgname#python-}
pkgver=0.1.326
pkgrel=3
pkgdesc="Python client libraries for calling the Google Earth Engine API."
arch=('any')
url="https://github.com/google/earthengine-api"
license=('APACHE')
depends=(
         'google-cloud-sdk'
         'python-google-api-python-client'
         'python-google-cloud-storage'
         'python-google-auth'
         'python-google-auth-httplib2'
         'python-httplib2'
         'python-six'
        )
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-tensorflow')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("$_name-$pkgver.tar.gz::https://github.com/google/earthengine-api/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('222135ea9b73d30a42bd1c2963fb6a60e5c7633cbb50c3cbc9eb5b80dce1ab9bb22fd7e7dda7590604a16aa362cd3ceb6b1c6936fece87b669621f7a455ad4cd')

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
