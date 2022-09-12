# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=condastats
pkgname=python-${_base}
pkgver=0.2.1
pkgrel=1
pkgdesc="Conda package stats CLI"
arch=(any)
url="https://github.com/sophiamyang/${_base}"
license=('custom')
depends=(python-dask python-s3fs python-pyarrow)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f63d4423ae82e9415a6a30ca7e7946578d49e09ee4c6cafed22e584c38d1cccd2325a0b2a1593c13ba5a255e69037dca0f817b3a65783c39a872773fb0f91290')

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
