# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python38-outcome
pkgver=1.2.0
pkgrel=2
pkgdesc='Capture the outcome of Python function calls'
arch=(any)
url=https://github.com/python-trio/outcome
license=(MIT)
depends=(
  python38
  python38-attrs
)
makedepends=(
  git
  python38-setuptools
)
checkdepends=(
  python38-pytest
  python38-pytest-asyncio
  python38-pytest-cov
)
_tag=ae996f8b7887e4a61ee6b3717c01ecba19a5b7dc
source=(git+https://github.com/python-trio/outcome.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd outcome
  git describe --tags | sed 's/^v//'
}

build() {
  cd outcome
  python3.8 setup.py build
}

check() {
  cd outcome
  PYTHONPATH=$PWD/build/lib pytest
}

package() {
  cd outcome
  python3.8 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/python38-outcome/
}

# vim: ts=2 sw=2 et:
