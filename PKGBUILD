# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: portaloffreedom

pkgbase=python-pyjokes
pkgname=(python-pyjokes python2-pyjokes)
pkgver=0.6.0
pkgrel=2
pkgdesc="One line jokes for programmers (jokes as a service)"
url="https://github.com/pyjokes/pyjokes"
license=("BSD")
arch=("any")
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a6d06a5428dd8f316a3f8784cac0180067b6530121d9cf3976d5f903db264c86')

prepare() {
	cp -a "pyjokes-$pkgver" "pyjokes-$pkgver-py2"
}

build() {
	pushd "pyjokes-$pkgver"
	python setup.py build
	popd

	pushd "pyjokes-$pkgver-py2"
	python2 setup.py build
}

package_python-pyjokes() {
	depends=('python')

	cd "pyjokes-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENCE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python2-pyjokes() {
	depends=('python2')
	conflicts=('python-pyjokes')

	cd "pyjokes-$pkgver-py2"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENCE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
