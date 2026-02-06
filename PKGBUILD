# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=condastats
pkgname=python-${_base}
pkgver=0.3.0
pkgrel=1
pkgdesc="Conda package stats CLI"
arch=(any)
url="https://github.com/sophiamyang/${_base}"
license=('custom')
depends=(python-dask python-s3fs python-pyarrow)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('3d2a859f4b1887f39376251fdfcd57ec07248508ca59e43e4b444097d381cc5a5089f5e3079a64f3f5daedc5eaa96e5f92c4476c0d0a7f8735dc1ad0d13bc84a')

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
