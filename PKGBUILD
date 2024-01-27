# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='py_cui'
pkgname="python-$_projectname"
pkgver='0.1.6'
pkgrel='2'
pkgdesc='Python library for creating all-ascii CUI/TUI interfaces with pre-built widgets'
arch=('any')
url="https://github.com/jwlodek/$_projectname"
license=('BSD-3-Clause')
depends=('python>=3.6.0')
makedepends=('python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('95cf3df28525d7429e2e0fb2bcdce607d3ae2f3ea24d85112e8e4f38fb7944bcab9f992c55b093c23a154f4ae4aa50bcb20ce0377f2af1830397e2effa10eb1e')

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
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
