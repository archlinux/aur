# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-gatspy
pkgver=0.3
pkgrel=2
pkgdesc='General tools for Astronomical Time Series in Python'
license=('BSD')
arch=('any')
url='https://github.com/astroml/gatspy'
depends=('python-numpy>=1.8' 'python-scipy')
optdepends=('python-astroml' 'python-supersmoother')
# checkdepends=('python-astroml' 'python-nose')
changelog=CHANGES.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('312e2a75f77a102b39a97d4d50db254c5fd6737a1f78f5bd787627390a20cea4')

prepare() {
	## remove tests from final package
	cd "gatspy-$pkgver"
	sed -i '/.tests/d' setup.py
}

build() {
	cd "gatspy-$pkgver"
	python setup.py build
}

## tests fails due to HTTP 404
# check() {
# 	cd "gatspy-$pkgver"
# 	nosetests gatspy
# }

package() {
	cd "gatspy-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
