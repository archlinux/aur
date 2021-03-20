# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='py_cui'
pkgname="python-$_projectname"
pkgver='0.1.3'
pkgrel='1'
pkgdesc='Python library for creating all-ascii CUI/TUI interfaces with pre-built widgets'
arch=('any')
url="https://github.com/jwlodek/$_projectname"
license=('BSD')
depends=('python>=3.2.0')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('47f5b21dd47ff3e475188fe367bab74170fac735b1d516e5860b8005efe1665d')

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
