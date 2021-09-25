# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgbase=python-log_colorizer
_name="${pkgbase#python-}"
pkgname=('python-log_colorizer' 'python2-log_colorizer')
pkgver=1.8.5
pkgrel=1
pkgdesc="Python logging formatter and handler"
arch=('any')
url="https://github.com/Kozea/log_colorizer"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'LICENSE')
sha256sums=('abc32c3832cde0a45b80af503c7e4a592747565cb520c7c6e374fdd21173407e'
            'f2dd41cf835899bee66416c983c98c1057658d113fd5364549f41affe4e200be')

prepare() {
	cp -a "$_name-$pkgver"{,-py2}
}

build() {
	pushd "$_name-$pkgver"
	python setup.py build
	popd

	pushd "$_name-$pkgver-py2"
	python2 setup.py build
}

check() {
	pushd "$_name-$pkgver"
	python setup.py pytest
	popd

	pushd "$_name-$pkgver-py2"
	python2 setup.py pytest
}

package_python-log_colorizer() {
	depends=('python')

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	cd "$_name-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-log_colorizer() {
	depends=('python2')

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	cd "$_name-$pkgver-py2"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
