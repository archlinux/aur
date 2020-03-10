# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_projectname='py_cui'
pkgname="python-$_projectname"
pkgver='0.0.3'
pkgrel='1'
pkgdesc='Python library for creating all-ascii CUI/TUI interfaces with pre-built widgets'
arch=('any')
url="https://github.com/jwlodek/$_projectname"
license=('BSD')
depends=('python>=3.2')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1146f5e2facec3413490c1630d8b229d1fc5bff111402f5030f41963c063622c')

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
