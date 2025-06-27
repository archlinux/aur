# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=python-audapa
_name=`echo ${pkgname} | grep -Po "(?<=-).*"`
pkgver=1.0.16
pkgrel=0
pkgdesc="Audio wave file manipulator"
arch=('any')
url="https://github.com/colin-i/audapa"
license=('0BSD')
depends=(gtk4 python-appdirs python-gobject python-cairo python-pyaudio)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bddfb927597e18d58cc03167f851e7357071b46336a10d8f1c3b6e78164dd4ed')

prepare() {
	_patches="`cat ../list`"
	cd ${_name}-${pkgver}
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
}

build() {
	cd ${_name}-${pkgver}
	python -m build --wheel --no-isolation # --skip-dependency-check
}

package() {
	cd ${_name}-${pkgver}
	python -m installer --destdir="$pkgdir" dist/*.whl
}
