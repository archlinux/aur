# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=sardana
pkgname=python-${_name}
pkgver=3.4.3
pkgrel=1
pkgdesc="Instrument control and data acquisition system"
arch=('any')
url="https://gitlab.com/sardana-org/${_name}"
license=('LGPL')
depends=(
  python-taurus itango python-lxml python-click python-pyqtgraph
  python-numpy python-h5py python-mock libibus python-pytest spyder
  python-scipy libblockdev python-pyqt5-datavisualization
  python-jsonpointer gobject-introspection-runtime
)
optdepends=(gedit gst-editing-services gom libgexiv2)
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/sardana-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('8b29f861eb45e70138469202dd93e9106419120974723e0efc4a9d1606e776e4')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
