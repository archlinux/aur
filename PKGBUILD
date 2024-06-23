# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: incomplete <incomplete at axion dot co>
# Contributor: ribbons <aur dot ribbons at codefive dot co dot uk>
_base=vispy
pkgname=python-${_base}
pkgver=0.14.3
pkgrel=1
pkgdesc="Interactive visualization in Python"
arch=(any)
url="https://${_base}.org"
license=(BSD-3-Clause)
depends=(python-numpy python-freetype-py python-hsluv python-kiwisolver python-packaging mesa-utils)
makedepends=(python-build python-installer python-setuptools-scm python-wheel cython npm fontconfig)
optdepends=('ipython: ipython-static'
  'python-pyglet: pyglet'
  'python-pyqt5: pyqt5'
  'python-pyqt6: pyqt6'
  'pyside2: pyside2'
  'pyside6: pyside6'
  'python-pysdl2: sdl2'
  'python-wxpython: wx'
  'python-meshio: io'
  'python-pillow: io')
source=(${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/v${pkgver}.tar.gz)
sha512sums=('933e83dfc16ddadbdbf968a633d2cc5d6ef72846662ab3787123958fe7e9eea653a9bfa7c43b86b954dacffc6ea3e2f54eb5612a31ccafe73ffb9bc14251ecf1')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
