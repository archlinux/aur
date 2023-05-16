# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=cleanurl
pkgname=python-${_base}
pkgver=0.1.15
pkgrel=1
pkgdesc="Removes clutter from URLs"
arch=(any)
url="https://github.com/xojoc/${_base}"
license=(AGPL3)
depends=(python-langcodes)
makedepends=(python-build python-installer python-setuptools python-wheel python-poetry-core)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('52d1f3159ed56203bc7374310dc48205a9567a3c5df595bc15e7647d0d0ab1c4fc01affd6c741d3b14e6ecfa2f4660b45c1814943cdf9d574adb7d619edb7dc1')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
