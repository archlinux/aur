# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python38-oauthlib
pkgver=3.2.2
pkgrel=1
_libname=oauthlib
pkgdesc="A generic, spec-compliant, thorough implementation of the OAuth request-signing logic"
arch=(any)
url="https://github.com/oauthlib/oauthlib"
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
depends=(python38-cryptography)
makedepends=(python38-setuptools python38-wheel python38-build python38-installer)
sha256sums=('9859c40929662bec5d64f34d01c99e093149682a3f38915dc0655d5a633dd918')

build() {
	cd "$srcdir/$_libname-$pkgver"
	python3.8 -m build --wheel --no-isolation
}

package_python38-oauthlib() {
	cd "$srcdir/$_libname-$pkgver"
	python3.8 -m installer --destdir="$pkgdir" dist/*.whl
	install -m0644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod -R a+r "$pkgdir/usr/lib"
}
