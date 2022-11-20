# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aiohttp-middlewares
_pypiname=aiohttp-middlewares
pkgver=2.2.0
pkgrel=1
pkgdesc="Collection of useful middlewares for aiohttp.web applications"
arch=('any')
url="https://github.com/playpauseandstop/aiohttp-middlewares"
license=('custom:BSD3')
depends=(
  'python'
  'python-aiohttp'
  'python-async-timeout'
  'python-yarl'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-pytest-aiohttp'
  'python-pytest-asyncio'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '354e97552937cc881ffb36f7c0bb5a679d7a81d485bf0dba6367eb5294586f60'
)

prepare() {
  rm "$_pypiname-$pkgver/.python-version"
}


build() {
  cd "$_pypiname-$pkgver"

  GIT_DIR=$PWD python -m build --wheel --no-isolation
}

check() {
  cd "$_pypiname-$pkgver"

  PYTHONPATH=src/ python -m pytest --override-ini='addopts=""'
}

package() {
  cd "$_pypiname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
