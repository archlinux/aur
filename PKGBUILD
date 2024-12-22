# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='py_cui'
pkgname="python-$_projectname"
pkgver='0.1.6'
pkgrel='4'
pkgdesc='Python library for creating all-ascii CUI/TUI interfaces with pre-built widgets'
arch=('any')
url="https://github.com/jwlodek/$_projectname"
license=('BSD-3-Clause')
depends=('python>=3.6.0')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('c14d9109ec143f51281e1cf4b6d7940f83009738b8057d06714cf3da72b5006168ffad9735aaadc32091890cfeea9163a2c66d4a46317fd8f3d9879611ab034c')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"

	# Run tests
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
