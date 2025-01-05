# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='microsoft-authentication-extensions-for-python'
pkgname='python-msal-extensions'
pkgver='1.2.0'
pkgrel='1'
pkgdesc='Microsoft Authentication Library extensions for Python'
arch=('any')
url="https://github.com/AzureAD/$_projectname"
license=('MIT')
depends=('python>=3.7.0' 'python-gobject' 'python-msal>=1.29.0' 'python-portalocker>=1.4.0')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('73e138fc93f09b748df0bd92910048ad9d680c572266b48d3adbcf1e2c168a95e844fff90dc659ae33831d26cb22428f65a96c21ee002aa56c5a81044b9e65ef')

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
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
