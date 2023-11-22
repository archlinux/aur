# Maintainer: Sylvain Poulain <sylvain.poulain@giscan.com>
_base=importchecker
pkgname=python-${_base}
pkgver=2.0
pkgrel=1
pkgdesc=" Command line utility to find unused imports in Python modules"
arch=(any)
url="https://github.com/zopefoundation/${_base}"
license=('ZPL')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
#https://github.com/m0rp43us/${_base}/releases/download/beta/openmeteo_py-${pkgver}.tar.gz)
b2sums=('622e63665d231f75b656867478cd1579e6ba98b77c51d43a7bdd3a743dbe97364f7ebac581426833aff2b3cf8b1b2735d8335d35682698e9cec0cb2d9394a4cf')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  # rm -r "${pkgdir}${site_packages}/${_base}"/tests/
  # mv "${pkgdir}/usr/etc" "${pkgdir}/etc"
}
