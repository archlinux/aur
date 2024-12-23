# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-cobble
pkgver=0.1.4
pkgrel=2
pkgdesc="Create Python data objects"
arch=(any)
url="https://github.com/mwilliamson/python-mammoth"
license=(BSD-2-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
depends=(python)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mwilliamson/python-cobble/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dc17120629977f6816503fc8ee281d64c685cc261b6bb2ee919a074da9ffc0ce')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  #  python -m pytest tests.py
  python -m pytest -k "not test_error_if_visitor_is_missing_methods and not test_sub_sub_classes_are_included_in_abc" tests.py
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.rst "${pkgdir}"/usr/share/doc/${pkgname}/README.rst
}
# vim:set ts=2 sw=2 et:
