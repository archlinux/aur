# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=sardana
pkgname=python-${_name}
pkgver=3.4.4
pkgrel=1
pkgdesc="Instrument control and data acquisition system"
arch=('any')
url="https://gitlab.com/sardana-org/${_name}"
license=('LGPL')
depends=(
  python-taurus itango python-lxml python-click python-pyqtgraph
  python-numpy python-h5py libibus python-pytest spyder
  python-scipy libblockdev python-pyqt5-datavisualization
  python-jsonpointer gobject-introspection-runtime
)
optdepends=(gedit gst-editing-services gom libgexiv2)
makedepends=(python-setuptools)
source=("${_name}-${pkgver}.tar.gz::https://gitlab.com/sardana-org/${_name}/-/archive/${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('e5b71842ae1d7445d3365c6b4c236a5188bddd039dce52f6d3eb4cd069e54588')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
