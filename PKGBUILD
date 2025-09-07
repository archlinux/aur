# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=sardana
pkgname=python-${_name}
pkgver=3.6.0
pkgrel=1
pkgdesc="Instrument control and data acquisition system"
arch=("any")
url="https://gitlab.com/sardana-org/${_name}"
license=("LGPL-3.0-or-later")
depends=(
  python-taurus itango python-lxml python-click python-pyqtgraph
  python-numpy python-h5py libibus python-pytest spyder
  python-scipy libblockdev python-pyqt5-datavisualization
  python-jsonpointer gobject-introspection-runtime python-gobject
  python-pydantic python-mock python-jsonpatch python-ruamel-yaml
)
optdepends=(gedit gst-editing-services gom libgexiv2)
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/sardana-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("73f2849bf5e44e2b83411fe93b0b2cf98deafdf3c35aad6c185e977496a2993b")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
