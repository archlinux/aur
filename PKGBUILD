# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dario Pellegrini <pellegrini.dario at gmail dd0f5c4e.diffot com>
_projectname='imapclient'
pkgname="python-$_projectname"
pkgver='3.0.1'
pkgrel='2'
pkgdesc='Easy-to-use, Pythonic and complete IMAP client library'
arch=('any')
url="https://github.com/mjs/$_projectname"
license=('BSD-3-Clause')
depends=('python>=3.7.0')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
# $pkgrel added to make sure our cached source file doesn't get used, as the previous pkgrel used a different upstream archive
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('aff08b392cb15d00d66833c7fba1147202ef37ff5f0ad9fb2c6e79daf67126cea00caaacfa6945b53f2e31b7d1525f4043aaacc94b34e695e26cf35b90f25259')

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
