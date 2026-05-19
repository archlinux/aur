# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-stomp.py
_libname=stomp_py
pkgver=9.0.0
pkgrel=1
pkgdesc="Python STOMP client, supporting versions 1.0, 1.1 and 1.2 of the protocol"
arch=(any)
url="https://github.com/jasonrbriggs/stomp.py"
license=(Apache-2.0)
depends=(python python-docopt python-websocket-client)
makedepends=(python-setuptools python-wheel python-build python-installer python-poetry)
source=(https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
sha256sums=('77b63fdd6cb2fb5e3d7032c5e1cde70c005f498d6096b77827efe71913196464')

build() {
	cd "$srcdir"/$_libname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir"/$_libname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
