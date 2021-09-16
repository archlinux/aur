# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=python-bittrex
pkgname=(python-bittrex python2-bittrex)
pkgver=0.3.0
pkgrel=2
pkgdesc='Python bindings for bittrex'
url='https://github.com/ericsomdahl/python-bittrex'
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-requests' 'python2-requests')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('93c4b440dabeae2b33c3d3cec660001958e0fde8f35b4c294c63fccd9622a579')

prepare() {
	cp -a "$pkgbase-$pkgver" "$pkgbase-$pkgver-py2"
}

build() {
	pushd "$pkgbase-$pkgver"
	python setup.py build
	popd

	pushd "$pkgbase-$pkgver-py2"
	python2 setup.py build
}

check() {
	pushd "$pkgbase-$pkgver/"
	python -m unittest bittrex/test/bittrex_tests.py || true
	popd

	pushd "$pkgbase-$pkgver-py2/"
	python2 -m unittest bittrex/test/bittrex_tests.py || true
}

package_python-bittrex() {
	depends=('python-requests')

	cd "$pkgbase-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python2-bittrex() {
	depends=('python2-requests')

	cd "$pkgbase-$pkgver-py2"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
