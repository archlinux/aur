# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=casacore
pkgname=python-${_base}
pkgver=3.5.2
pkgrel=1
pkgdesc="A wrapper around ${_base^^}, the radio astronomy library"
arch=('x86_64')
url="https://github.com/${_base}/${pkgname}"
license=(LGPL3)
depends=(${_base} python-numpy python-six)
makedepends=(python-build python-installer python-setuptools python-wheel boost)
provides=('python-pyrap')
replaces=('python-pyrap')
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b3395215c76634a53ceebf030e6558e5f60b5c57242b40343cc8889f1e7d5164c6d9b174a418b8d1606aa7d685af7460a829269c6f20b952fbe8a52809fbc8cd')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
