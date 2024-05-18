# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=splinepy
pkgname=python-${_base}
pkgver=0.1.0
pkgrel=1
pkgdesc="Python N-Dimensional Bezier, RationalBezier, BSpline and NURBS library with C++ Backend"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-gustaf)
makedepends=(python-build python-installer python-scikit-build-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('2bcaa24f9b3c71daf1796d68e0c8dac9e9dc208255973c7414c4950ea947fffa2a28b58d6a5f74550471fc111412aa67b2edaf61b253b01f59500cec63b06360')

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
