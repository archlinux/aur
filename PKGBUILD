# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Peter Baldwin <bald_pete@hotmail.com>
_projectname='jinja'
pkgname="python2-$_projectname"
pkgver='2.11.3'
pkgrel='3'
pkgdesc='A simple pythonic template language written in Python - python2 version'
arch=('any')
url="https://palletsprojects.com/p/$_projectname"
license=('BSD')
depends=('python2-setuptools' 'python2-markupsafe')
makedepends=('python2-setuptools' 'python2-markupsafe')
checkdepends=('python2-pytest')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/pallets/$_projectname/archive/$pkgver.tar.gz")
sha256sums=('4be44a9e55fb069347b217d2d66d51d8b0a97f2f76985b90630bb4f317eb042a')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	PYTHONPATH='build/lib' pytest2
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE.rst' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.rst"
}
