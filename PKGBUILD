# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='py_cui'
pkgname="python-$_projectname"
pkgver='0.1.4'
pkgrel='1'
pkgdesc='Python library for creating all-ascii CUI/TUI interfaces with pre-built widgets'
arch=('any')
url="https://github.com/jwlodek/$_projectname"
license=('BSD')
depends=('python>=3.6.0')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9d7ebac19fde15249442d141ea42e0b150cd296547d8bb0646d84f6031cc72d8')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
