# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=splinepy
pkgname=python-${_base}
pkgver=0.0.51
pkgrel=1
pkgdesc="Python N-Dimensional Bezier, RationalBezier, BSpline and NURBS library with C++ Backend"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-gustaf)
makedepends=(python-build python-installer python-scikit-build-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('73ef20026a31b97ab3814b51cf88fcfef0ea247c99c4e1990cf3b8a04f18ce40addc73293cd9e1224eee58f95b42849964327eff332edd6e0d37b62acd58e703')

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
