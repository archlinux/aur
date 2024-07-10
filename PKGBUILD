# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=splinepy
pkgname=python-${_base}
pkgver=0.1.1
pkgrel=1
pkgdesc="Python N-Dimensional Bezier, RationalBezier, BSpline and NURBS library with C++ Backend"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-gustaf)
makedepends=(python-build python-installer python-scikit-build-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('7cbadc107b74e03b92f9287b3f68c8bca981d5a9499991e91331203a55456493213f5d62cdcf90dcaf02e44aa64a38250bf88e5f2c6934e91102b3c99cd658d9')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
