# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=python-torra
_name=`echo ${pkgname} | grep -Po "(?<=-).*"`
pkgver=1.0.41
pkgrel=0
pkgdesc="Torrent client"
arch=('any')
url="https://github.com/colin-i/tora"
license=('0BSD')
depends=(gtk4 python-appdirs libtorrent-rasterbar)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('7b89f391dc1ac33f3ef2d55fd86439038cf22ff5188cd5d84f9f542a76004426')

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
