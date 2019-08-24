# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

pkgname=python-nifty
_pkgname=nifty
pkgver=5.0.1
pkgrel=1
pkgdesc="Versatile library designed to enable the development of signal inference algorithms that operate regardless of the underlying grids (spatial, spectral, temporal, ...) and their resolutions"
arch=('any')
license=('GPL3')
url="http://ift.pages.mpcdf.de/nifty/ift.html"
depends=('python' 'python-scipy' 'python-pypocketfft')
optdepends=("python-pyhealpix: harmonic transforms involving domains on the sphere"
	"python-nifty_gridder: radio interferometry responses"
	"python-mpi4py: MPI-parallel execution"
	"python-matplotlib: field plotting")
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz"::"https://gitlab.mpcdf.mpg.de/ift/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha512sums=('c5819f39a7f8011019a1d6963797b1739dda66ea4819355e3c893071a47f4f77a9885b9e8e2c79eaa9b441bb5cdf1864d5dadf988e7d4f465d8651857112747f')

build() {
	cd "${srcdir}/${_pkgname}-v${pkgver}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-v${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
