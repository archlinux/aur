# Maintainer: Gregory Land <landjgregory at gmail dot com>
pkgname=python-dvc-http
_name=${pkgname#python-}
pkgver=2.27.2
pkgrel=1
pkgdesc="http plugin for dvc"
arch=('any')
url="https://github.com/iterative/dvc-http.git"
license=('APACHE')
depends=(
         'dvc'
         'python-fsspec'
         'python-aiohttp-retry'
        )
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
source=("$_name-$pkgver.tar.gz::https://github.com/iterative/dvc-http/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8e197859c53e89a077f0d8c09f453dfcd36d13b3fe90e30d0694113e5a14ce34')
export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd "$_name-$pkgver/"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver/"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

#check(){
#  cd "earthengine-api-$pkgver/python/"
#  python -m pytest ee/tests
#}
