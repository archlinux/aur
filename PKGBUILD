# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-bugsnag
pkgver=4.1.1
pkgrel=1
pkgdesc='Official bugsnag error monitoring and error reporting for various python apps.'
arch=('any')
url='https://www.bugsnag.com/platforms/python-error-reporting'
license=('MIT')
depends=('python-webob')
optdepends=(
	'python-flask: Flask integration'
	'python-blinker: Flask integration')
makedepends=('python-setuptools')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/bugsnag/bugsnag-python/archive/v$pkgver.tar.gz")
sha256sums=('9280c7b04a48ce1e60236e7168c78eb3d8cde8820b168e4801251c0c6bea761d')

build() {
	cd "bugsnag-python-$pkgver"
	python setup.py build
}

package() {
	cd "bugsnag-python-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 UPGRADING.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
