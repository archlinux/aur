# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=python-torra
_name=`echo ${pkgname} | grep -Po "(?<=-).*"`
pkgver=1.0.39
pkgrel=0
pkgdesc="Torrent client"
arch=('any')
url="https://github.com/colin-i/tora"
license=('0BSD')
depends=(gtk4 python-appdirs libtorrent-rasterbar)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('8d8088cc0d813e2030328bdcdfc77850dfcb5dc586a9b8a5baa09adf9ae3656b')

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
