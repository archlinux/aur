# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-pyhealpix
_pkgname='pyHealpix'
_pkgver=0.0.0
# Unfortunately, upstream does not tag releases; just use the latest commit for now as done in the instruction material
_commit='2f4d51488db0f6bbe9e9d30c05dd33cdb169f0f7'
pkgver="${_pkgver}b${_commit:0:10}"
pkgrel=1
pkgdesc="Minimalistic Python interface for Healpix C++"
arch=('any')
license=('GPL2')
url="https://gitlab.mpcdf.mpg.de/ift/${_pkgname}"
depends=('python' 'python-numpy' 'pybind11')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://gitlab.mpcdf.mpg.de/ift/${_pkgname}/-/archive/${_commit}/${_pkgname}-${_commit}.tar.gz")
sha512sums=('e3beaab5514fbf240d8641ad23055e369ad969b8d05163e1ac21dc997da342dec5cf0d1b2decf960358b494a783d3fe6aaf7ee2376157b20cdc5deb12a3fb47b')

build() {
	cd "${srcdir}/${_pkgname}-${_commit}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${_commit}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
