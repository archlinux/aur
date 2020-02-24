# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='py_cui'
pkgname="python-$_projectname"
pkgver='0.0.2'
pkgrel='1'
pkgdesc='Python library for creating all-ascii CUI/TUI interfaces with pre-built widgets'
arch=('any')
url="https://github.com/jwlodek/$_projectname"
license=('BSD')
depends=('python>=3.2')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0cc9f8b620c04df483234f45b7184670835a7e707374bf5c96b6701b20d66dab')

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
