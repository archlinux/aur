# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=datatypes
pkgname=python-${_base}
pkgver=0.27.0
pkgrel=1
pkgdesc="Utility Classes and Functions that are handy across multiple projects"
arch=(any)
url="https://github.com/jaymon/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('8ff48497d9380342a45590e0195d8ef45aea13b80741af9afb01f1359d12e1004268510999b8aff2964e9b64fb891c5e9b29ffb10850b824c7d200d2f7d1ba54')

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
