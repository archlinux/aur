# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=pytest-lazy-fixture
pkgname=python38-${_pkg}
pkgver=0.6.3
pkgrel=5
pkgdesc="Use fixtures in @pytest.mark.parametrize"
arch=(any)
url="https://github.com/tvorog/pytest-lazy-fixture"
license=(MIT)
depends=(python38-pytest)
makedepends=(python38-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
sha256sums=('0e7d0c7f74ba33e6e80905e9bfd81f9d15ef9a790de97993e34213deb5ad10ac')

build() {
  cd ${_pkg}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  PYTHONPATH="${PWD}" pytest
}

package() {
  cd ${_pkg}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
