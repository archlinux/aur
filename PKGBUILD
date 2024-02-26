# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Bumsik Kim <k.bumsik@gmail.com>

_distname=VirtScreen
pkgname=virtscreen
pkgver=0.3.2
pkgrel=1
pkgdesc="Use your iPad/tablet/computer as a secondary monitor on Linux (dderjoel's continuation fork)"
arch=('any')
url="https://github.com/dderjoel/${_distname}"
license=('GPL-3.0-only')
depends=(
  'python'
  'python-netifaces'
  'python-pyqt5'
  'python-qasync'
  'qt5-declarative'
  'qt5-quickcontrols'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=('arandr: for display settings option')
_tarname="${_distname}-${pkgver}"
source=("${_tarname}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('2c9480f0cb96401628dd67f8e3d143d6cb386421106e6e42d7dc4793ad61d12df33c8f31bdc33e222952241f07fd100d6738d8aa754b751ae98bcb4439f08340')

build() {
  cd "${_tarname}"
  python -m build --wheel --no-isolation
}

package() {
  depends+=(
    'x11vnc'
    'xorg-xrandr'
  )
  cd "${_tarname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
