# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=snuggs
pkgname=python-${_base}
pkgver=1.4.7
pkgrel=3
pkgdesc="Snuggs are s-expressions for Numpy"
url="https://github.com/mapbox/${_base}"
license=(MIT)
arch=('any')
depends=(python-numpy python-pyparsing)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-hypothesis)
source=(${_base}-${pkgver}::${url}/archive/${pkgver}.tar.gz)
sha512sums=('c1f40e521d1b0cf15075b22b04000c74ecbd0522cdd820b8c159aac812924d877349b3f3bca93b09eed5b025a34c26665a41c7a52a8145419558b115cf8ef361')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
