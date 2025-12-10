# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
pkgname=python-graphcalc
pkgver=1.2.15
pkgrel=1
pkgdesc='Python package to compute graph invariants'
arch=(any)
url='https://github.com/RandyRDavila/GraphCalc'
license=('MIT')
depends=('python>=3.7'
         'python-numpy'
         'python-pillow'
         'python-pulp'
         'python-matplotlib'
         'python-dateutil'
         'python-pandas')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cdbba93444727216ab05a574e8eb28f48009f2afb9b848588497b7abf0e1f360')

build() {
	cd "GraphCalc-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "GraphCalc-$pkgver"
	pytest
}

package() {
	cd "GraphCalc-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
