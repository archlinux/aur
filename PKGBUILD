# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=numpy-typing-compat
pkgname=python-${_base}
pkgdesc="Static typing compatibility layer for older versions of NumPy"
pkgver=20251206
pkgrel=1
arch=(any)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-numpy python-uv-build python-jinja python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base//-/_}-${pkgver}.tar.gz)
sha512sums=('3397e429ce923952b47ec4b42d0e4c3369bbc4fe8bd4655034b48925aba040ca562a80c2963ae2f74671ff2c612a304dc0d1403aa1b45038a870ce2ad693ce37')

build() {
  cd ${_base//-/_}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base//-/_}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
