# Maintainer: Lukas Lipinsky <6032558+Mr-Tao@users.noreply.github.com>

pkgname=python-androidtvremote2
pkgver=0.3.3
pkgrel=1
pkgdesc='Python implementation of the Android TV Remote protocol v2'
arch=('any')
url='https://github.com/tronikos/androidtvremote2'
license=('Apache-2.0')
depends=(
  'python-aiofiles'
  'python-cryptography'
  'python-protobuf'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest' 'python-pytest-asyncio')
# The PyPI sdist omits test helpers.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e67fb0ad6bfc6d7d2ce0f60c77b07a5705ac332c1aad1e9a021fc454209eb0a2')

build() {
  cd "androidtvremote2-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "androidtvremote2-$pkgver"
  PYTHONPATH=src python -m pytest -q
}

package() {
  cd "androidtvremote2-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
