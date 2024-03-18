# Maintainer: Gustav Sörnäs <gustav@sornas.net>
# vim: ts=2 sw=2 et:

pkgname=python-aiohttp-sse
_pkgname=aiohttp-sse
pkgver=2.2.0
pkgrel=3
pkgdesc="Server-sent events support for aiohttp"
arch=('x86_64')
url="https://github.com/aio-libs/aiohttp-sse"
license=('Apache-2.0')
depends=('python' 'python-aiohttp')
optdepends=()
makedepends=('python-build' 'python-installer')
checkdepends=('python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  PYTHONPATH="$PWD/build/lib/" pytest
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
