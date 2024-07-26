# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=splinepy
pkgname=python-${_base}
pkgver=0.1.2
pkgrel=1
pkgdesc="Python N-Dimensional Bezier, RationalBezier, BSpline and NURBS library with C++ Backend"
url="https://tataratat.github.io/${_base}"
license=(MIT)
arch=(any)
depends=(python-gustaf)
makedepends=(python-build python-installer python-scikit-build-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('04e9e1648bea60d7b1432da79e9372368e7acd6d6a7ba8eb6a47894594adacdfc49dd5d640f70ecdb1619b2b39b14a77af945d2989b575f01ee536d76a88bef8')

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
