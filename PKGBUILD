# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=ppft
pkgname=python-${_base}
pkgdesc="distributed and parallel python"
pkgver=1.7.6.5
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python-six)
makedepends=(python-setuptools)
optdepends=('python-dill: for serialization support')
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('1ca664208afe7003f114dc2f5be3d54f0ef87c40c70dab43a04d586962965d82911ba41c515eb9a9fa84acacef01462759899ea1a7b73928784ab11886d9335c')

build() {
  cd "${_base}-${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
