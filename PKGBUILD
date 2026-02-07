# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=condastats
pkgname=python-${_base}
pkgver=0.4.2
pkgrel=1
pkgdesc="Conda package stats CLI"
arch=(any)
url="https://github.com/sophiamyang/${_base}"
license=('custom')
depends=(python-dask python-s3fs python-pyarrow)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('de1c5410d3da89b9f22c27ab9d5402cb51052daaa5d7aee6c764d12e2f9678e323bc8abd137511b83d5cf2a99054757681909cb339be9e5e640c970faceabd29')

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
