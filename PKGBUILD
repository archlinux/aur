# Maintainer: sasvari <sasvari@fastmail.com>
#             adapted from package python2-scikit-rf
pkgname="python-scikit-rf"
pkgver=0.25.0
pkgrel=1
pkgdesc="Scikit-rf (aka skrf) is a python package for RF/Microwave engineering"
arch=(any)
url="https://github.com/scikit-rf/scikit-rf"
license=("BSD")
depends=(
	"python"
	"python-matplotlib"
	"python-nbsphinx"
	"python-networkx"
	"python-numpy"
	"python-openpyxl"
	"python-pandas"
	"python-scipy"
	"python-xlwt"
)
makedepends=(python-build python-installer python-wheel)
optdepends=(
	"python-pyvisa: for instrument control"
	"python-vxi11: for instrument control over ethernet"
	"python-xlrd: for xls reading"
)
sha256sums=('93a69d35c0a0c686a5024db438212f1f8a8579a8b036f3b251feea93b09768d5')
source=("${pkgname}-${pkgver}::https://github.com/scikit-rf/scikit-rf/archive/refs/tags/v${pkgver}.tar.gz")


build() {
	cd "${srcdir}//scikit-rf-${pkgver}"
	export PYTHONHASHSEED=0
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}//scikit-rf-${pkgver}"
	find dist -name '*.whl' -exec python -m installer --compile-bytecode 1 --destdir="${pkgdir}" {} \;
}
