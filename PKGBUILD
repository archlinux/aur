# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
# Contributor: incomplete <incomplete at axion dot co>
# Contributor: ribbons <aur dot ribbons at codefive dot co dot uk>
_base=vispy
pkgname=python-${_base}
pkgver=0.16.2
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
sha512sums=('b618177733bf5ecd74e378525b53ba8ee3b847aa635367774322f27f83b63457921b6a86c5043827e6d2882b99906bd50293d8ec5f051dc7fe05ff57025abbbf')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
