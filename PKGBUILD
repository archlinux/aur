# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
_base=hexbytes
pkgname=python-${_base}
pkgver=2.0.0
pkgrel=1
pkgdesc="Python bytes subclass that decodes hex, with a readable console output"
arch=(any)
url="https://github.com/ethereum/$_base"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2e0e3b22f59f3cd342c13277cc70cbb225d6534a3db763b67e115165d8db96000067435eb9e9913786cf5be4eb19cb46428bf0a48b1f0447322daddd31225aea')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
