# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Gerard Ribugent <ribugent <at> gmail <dot> com>
_projectname='microsoft-authentication-extensions-for-python'
pkgname='python-msal-extensions'
pkgver='1.3.1'
pkgrel='1'
pkgdesc='Microsoft Authentication Library extensions for Python'
arch=('any')
url="https://github.com/AzureAD/$_projectname"
license=('MIT')
depends=('python>=3.9.0' 'python-gobject' 'python-msal>=1.29.0' 'python-portalocker>=1.4.0' 'org.freedesktop.secrets')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('45c4b39a8179c88111f44e7322e7d9bbee9b61852f0b2972fc437058ff63ee0646a37f923ad32974d3054bf9d4d5bdf0ea52a69a80453c1ee0b4c21399f83109')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py build
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python -m pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
