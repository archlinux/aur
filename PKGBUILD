# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='imgsize'
pkgname="python-$_projectname"
pkgver='2.1'
pkgrel='4'
pkgdesc='Pure Python image size library - python version'
arch=('any')
url="https://github.com/ojii/$_projectname"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a413cc368cac5f5cf9199038887e52ed1ece08f431885dd762dde2df56882f13')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python -m unittest discover
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
