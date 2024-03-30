# Maintainer: 
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-asyncio_extras
_name=${pkgname#python-}
pkgver=1.3.2
pkgrel=2
pkgdesc="Asynchronous generators and context managers for asyncio"
arch=('any')
url="https://github.com/agronholm/asyncio_extras"
license=('MIT')
depends=('python-async_generator')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
source=("$_name-$pkgver.tar.gz::https://github.com/agronholm/asyncio_extras/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('af41dbf28200d3a4e29ca3c2330d7d89ef08dd2554a4187ae92b3616f68d04a7')

build() {
  cd "$_name-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH=. pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
