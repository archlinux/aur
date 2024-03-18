# Maintainer: Gustav Sörnäs <gustav@sornas.net>
# vim: ts=2 sw=2 et:

pkgname=python-aiohttp-sse
pkgver=2.2.0
pkgrel=1
pkgdesc="Server-sent events support for aiohttp"
arch=('x86_64')
url="https://github.com/aio-libs/aiohttp-sse"
license=('Apache')
depends=('python' 'python-aiohttp')
optdepends=()
makedepends=('python-build' 'python-installer')
checkdepends=('python-pytest' 'python-pytest-aiohttp' 'python-pytest-asyncio' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  mv ${pkgname/python-/}-$pkgver $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  PYTHONPATH="$PWD/build/lib/" pytest
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
