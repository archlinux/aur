# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: G. Bernstein, M. Jarvis and E. Sheldon

pkgname=python-pixmappy
pkgver=1.0.0
pkgrel=1
pkgdesc=" Python interface to gbdes pixel map (astrometry) solutions "
arch=('any')
url="https://github.com/gbernstein/pixmappy"
license=('BSD')
depends=(
	'python-numpy'
	'python-future'
	'python-astropy'
	'python-scipy'
	'python-yaml'
	'python-coord')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9ef1ddeaea58ca50cbf7226a2c68ac183726ae3e97028f9011849dd086f7c48d')

build() {
	cd "pixmappy-$pkgver"
	python setup.py build
}

package() {
	cd "pixmappy-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 Piff_LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
