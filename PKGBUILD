# Maintainer: Gregory Land <landjgregory at gmail dot com>
pkgname=python-dvc-http
_name=${pkgname#python-}
pkgver=2.32.0
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
sha256sums=('a75873184c904c2a9dd2f5f721be0f9118f764860cf44430f10cd5b50c795fb1')
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
