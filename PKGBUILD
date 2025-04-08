# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=sardana
pkgname=python-${_name}
pkgver=3.5.2
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
  python-pydantic python-mock python-jsonpatch python-ruamel-yaml
)
optdepends=(gedit gst-editing-services gom libgexiv2)
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/sardana-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=("1ab49c266f6e3d3143ca267a342d9a844a417b7839de432430866f8f56422105")

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
