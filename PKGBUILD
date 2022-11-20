# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-environ-config
_pypiname=environ-config
pkgver=22.1.0
pkgrel=1
pkgdesc="Python Application Configuration With Environment Variables"
arch=('any')
url="https://github.com/hynek/environ-config"
license=('APACHE')
depends=(
  'python'
  'python-attrs'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-moto'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('98c177664db5750394f281b3fd5ab12e3fa4b780cb3293411b3405f1cfe55d63')

build() {
  cd "$_pypiname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pypiname-$pkgver"

  PYTHONPATH=src/ python -m pytest
}

package() {
  cd "$_pypiname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
