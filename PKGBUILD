# Maintainer: Florian Hülsmann <fh@cbix.de>

pkgname=cadet-process
pkgver=0.9.1
pkgrel=1
pkgdesc='Modeling and simulation framework for biotechnology processes – python frontend'
arch=(any)
url='https://cadet-process.readthedocs.io/en/latest/'
license=(GPL-3.0-only)
depends=(python)
makedepends=(git python-build python-installer python-wheel)
source=("git+https://github.com/fau-advanced-separations/CADET-Process#tag=v$pkgver")
sha256sums=('fd2b6f8510ae0df0487ae5bc700812f2643a1cac2dfcad29597371c760d32ebc')

build() {
	cd CADET-Process
	python -m build --wheel --no-isolation
}

package() {
	depends+=(cadet-core python-numpy python-psutil python-pytest)
	cd CADET-Process
	python -m installer --destdir="$pkgdir" dist/*.whl
}
