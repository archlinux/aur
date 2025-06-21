# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=python-torra
_name=`echo ${pkgname} | grep -Po "(?<=-).*"`
pkgver=1.0.38
pkgrel=0
pkgdesc="Torrent client"
arch=('any')
url="https://github.com/colin-i/tora"
license=('0BSD')
depends=(gtk4 python-appdirs libtorrent-rasterbar)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e2514ae7d2f7121f2d67468e0351d1f2fa2555233124d73094b8ed30930addd3')

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
