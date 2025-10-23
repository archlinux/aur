# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean at 4ray dot co>
# Contributor: Antonio Rojas <arojas at archlinux dot org>
_base=webassets
pkgname=python-${_base}
pkgver=3.0.0
pkgrel=1
pkgdesc="Asset management application for Python web development"
arch=(any)
url="https://github.com/miracle2k/${_base}"
license=('custom')
depends=(python)
makedepends=(python-build python-hatchling python-installer)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('1f0e2c71badbec30c8c2e38de57a3480274cff614d105395777ad9d2d71b7cde9a555b63b799d966852a149bfddc36cca8a034ec3ed744d8f1bd2d16934fcc56')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
