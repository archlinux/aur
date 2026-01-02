# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=numpy-typing-compat
pkgname=python-${_base}
pkgdesc="Static typing compatibility layer for older versions of NumPy"
pkgver=20251206.2.4
pkgrel=1
arch=(any)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-numpy python-uv-build python-jinja python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('eba8d37b28f9a17b8f2679a6017d40adc418e898802a4674550deed16074780136bc336bd547f79de1fd53a28fa688299dbe41dc17403aba173f4f355f9f6b93')

build() {
  cd ${_base//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
