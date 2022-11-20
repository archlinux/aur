# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python38-pytest-trio
pkgver=0.8.0
pkgrel=2
pkgdesc='Pytest plugin for Trio'
arch=(any)
url=https://github.com/python-trio/pytest-trio
license=(
  APACHE
  MIT
)
depends=(
  python38
  python38-async_generator
  python38-hypothesis
  python38-pytest
  python38-trio
)
makedepends=(
  git
  python38-setuptools
)
checkdepends=(
  python38-pytest-cov
  python38-trio-asyncio
)
_tag=250ec45f5d72eca78ab0ea2d1571667d2c51f8b5
source=(git+https://github.com/python-trio/pytest-trio.git#tag=${_tag})
b2sums=(SKIP)

pkgver() {
  cd pytest-trio
  git describe --tags | sed 's/^v//'
}

build() {
  cd pytest-trio
  python3.8 setup.py build
}

check() {
  cd pytest-trio
  PYTHONPATH="." PYTEST_PLUGINS="pytest_trio.plugin" python3.8 -m pytest
}

package() {
  cd pytest-trio
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python-pytest-trio/
  install -Dm 644 LICENSE.MIT -t "${pkgdir}"/usr/share/licenses/python-pytest-trio/
}

# vim: ts=2 sw=2 et:
