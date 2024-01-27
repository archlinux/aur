# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=splinepy
pkgname=python-${_base}
pkgver=0.0.50
pkgrel=1
pkgdesc="Python N-Dimensional Bezier, RationalBezier, BSpline and NURBS library with C++ Backend"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-gustaf)
makedepends=(python-build python-installer python-scikit-build-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('1aa878ffd4bf1b311841cd2f2e0e5db148ebd45817a8e7c8f1757e35330a378b5b887c4ab290c283682fe4e80b944c4e771068434910a5e05e740217a3a1f68a')

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
