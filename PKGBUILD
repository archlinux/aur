# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bincopy
pkgname=python-bincopy
pkgver=19.1.0
pkgrel=1
pkgdesc="Mangling of various file formats that conveys binary information"
arch=(any)
url="https://github.com/eerimoq/bincopy"
license=(MIT)
depends=(
  python
  python-argparse-addons
  python-humanfriendly
  python-pyelftools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('a7fd582fec4946954b8ec29d29c671482dac66ba85b784e1c1fcdf045f7f2bebf99726caa1c591993ee462b2b63d8c77f5c03b42b3b150a4b0579fc54a12efa2')
b2sums=('0d54fa10aa09c69949931069a73460af746e78b6829a2cd5db52d650bb0469427d9367e577bb4e2706c8826cbf7a6ca162efb8082b02621b5e3ee31a2e9767b6')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
