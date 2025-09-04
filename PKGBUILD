# Contributor: Jose Carlos Temprado <thempra@overxet.com>

pkgname=python-pycoingecko
pkgver=3.2.0
pkgrel=1
pkgdesc='Python3 wrapper around the CoinGecko API (V3)'
arch=('x86_64')
url="https://github.com/man-c/pycoingecko"
license=('MIT')
depends=(python python-requests)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest python-responses)
source=("https://github.com/man-c/pycoingecko/archive/refs/tags/$pkgver.zip")
sha256sums=('9860260c16db4097ca5f72704d8102cd617639e82e7e1d7d9312ed8838ef1017')

build() {
  cd pycoingecko-${pkgver}
  python -m build --wheel --no-isolation
}
check() {
  cd pycoingecko-${pkgver}
  PYTHONPATH="$PWD" pytest
}
package() {
  cd pycoingecko-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests 
}
