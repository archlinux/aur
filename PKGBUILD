# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='py_cui'
pkgname="python-$_projectname"
pkgver='0.1.0'
pkgrel='1'
pkgdesc='Python library for creating all-ascii CUI/TUI interfaces with pre-built widgets'
arch=('any')
url="https://github.com/jwlodek/$_projectname"
license=('BSD')
depends=('python>=3.2')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('65abfa615bde15341907dfcb6ffa42a88ca481c95751e2ddc29f17a4a06c9db9')

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
