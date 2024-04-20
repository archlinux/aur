# Maintainer: David Runge <dvzrv@archlinux.org>

_name=setuptools-declarative-requirements
pkgname=python-setuptools-declarative-requirements
pkgver=1.3.0
pkgrel=6
pkgdesc="File support for setuptools declarative setup.cfg"
arch=(any)
url="https://github.com/s0undt3ch/setuptools-declarative-requirements"
license=(Apache-2.0)
depends=(
  python
  python-setuptools
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-toml
  python-wheel
)
checkdepends=(
  pypiserver
  python-pytest
  python-pytest-shell-utilities
  python-virtualenv
)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('eb20016ab0b8029a38ff4632d19d63cd4b6396c9d101efce577ac862feb3fc485ac4a644035d3267cd05caf679f9b2259e1d1340f8cd902ea7c7451e099c71cc')
b2sums=('5030cd7a0b651a11bec8ca9ca4db680c86634c3fe895a6a76544468c2f48aef43a15e30d0c7ba1eea1133dc5b47257a061f6700b8d1e1863d72430a0459ba9f5')

build() {
  cd $_name-$pkgver
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  # disable failing test:
  # https://github.com/s0undt3ch/setuptools-declarative-requirements/issues/4
  pytest -vv -k "not test_build_package[bdist_wheel]"
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
