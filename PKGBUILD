# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tcxreader
pkgname=python-${_base}
pkgdesc="Reader for Garmin's TCX file format"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/alenrajsp/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('692f3d08f3e70c0889ec96677071b2d487a4a214dc0bed863e9b6c4dfb045273aff206fa446df4571c797624377fe22c0d6f88752aa4f6ea421320aacd30fd4e')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
