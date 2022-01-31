# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>

pkgname=python-tikzplotlib
pkgver=0.10.1
pkgrel=1
pkgdesc="Convert matplotlib figures into TikZ/PGFPlots"
license=('MIT')
arch=('any')
url="https://github.com/nschloe/tikzplotlib"
depends=(
	'python>=3.7'
	'python-matplotlib'
	'python-pillow'
	'python-numpy'
	'python-webcolors')
makedepends=('python-flit-core' 'python-build' 'python-install')
checkdepends=('python-pytest' 'python-pandas' 'python-pytest-randomly')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c2875e4c0dedc617813833f00da381c607f262bcb69b2b3de717cf9f3d3c5611')

build() {
	cd "tikzplotlib-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
	# python setup.py build
}

check() {
	cd "tikzplotlib-$pkgver"
	PYTHONPATH=./src pytest -x -c /dev/null
	# python setup.py pytest
}

package() {
	export PYTHONHASHSEED=0
	cd "tikzplotlib-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	# PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
