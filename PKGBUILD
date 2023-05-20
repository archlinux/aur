# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=datatypes
pkgname=python-${_base}
pkgver=0.9.3
pkgrel=1
pkgdesc="Utility Classes and Functions that are handy across multiple projects"
arch=(any)
url="https://github.com/jaymon/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('20b14a70001f5830dfcf1054164f6551e96301f7aeb4569935009f9cc57df8ff5b0825cdb619793d3e2b038dbc553677ccd988738344a86a3fbfc2a56190f351')

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
