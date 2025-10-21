# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=datatypes
pkgname=python-${_base}
pkgver=0.27.2
pkgrel=1
pkgdesc="Utility Classes and Functions that are handy across multiple projects"
arch=(any)
url="https://github.com/jaymon/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('673898cf735a82044dd3cf9beeb82cf90d325c1c70fa784f46ba34fb72b559b9d11b0246561775b835ad299ae1360820baf17bc7cba80a62b68c83cdddbe1e6b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
