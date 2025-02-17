# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=sardana
pkgname=python-${_name}
pkgver=3.5.1
pkgrel=1
pkgdesc="Instrument control and data acquisition system"
arch=("any")
url="https://gitlab.com/sardana-org/${_name}"
license=("LGPL-3.0-or-later")
depends=(
  python-taurus itango python-lxml python-click python-pyqtgraph
  python-numpy python-h5py libibus python-pytest spyder
  python-scipy libblockdev python-pyqt5-datavisualization
  python-jsonpointer gobject-introspection-runtime
)
optdepends=(gedit gst-editing-services gom libgexiv2)
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/sardana-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("0a9fd0d96b310b4947f5a1d9b09d8afc5b7b446f74b41bd4b2c92858c3def831")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
