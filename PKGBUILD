# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dario Pellegrini <pellegrini.dario at gmail dd0f5c4e.diffot com>
_projectname='imapclient'
pkgname="python-$_projectname"
pkgver='3.1.0'
pkgrel='1'
pkgdesc='Easy-to-use, Pythonic and complete IMAP client library'
arch=('any')
url="https://github.com/mjs/$_projectname"
license=('BSD-3-Clause')
depends=('python>=3.8.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('a8c929affe8572f65bb6dafefc48ba064f1bb12230da7ada9d7af338ecc3834a6216509c59aeccad7faf47dd167dfc0b383b81988091b6578580a2fa8e3d5b15')

_sourcedirectory="$_projectname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	pytest
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'COPYING' "$pkgdir/usr/share/licenses/$pkgname/BSD-3-Clause"
}
