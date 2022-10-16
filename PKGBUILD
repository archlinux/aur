# Mantainer: Jose Riha <jose1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=cheap_repr
pkgname=python-${_base}
pkgdesc="Better version of repr/reprlib for short, cheap string representations"
pkgver=0.5.1
pkgrel=3
arch=(any)
url="http://github.com/alexmojaki/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools-scm)
checkdepends=(python-pytest python-django)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5f389587cdb6c5e037ecb2eb64b17b391a3993cb2c5010db8cdc78cd709183911273291fb346276d9fac07ac6d93454697dcdbdb49f5dead9c16b3dce4aa94b7')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
