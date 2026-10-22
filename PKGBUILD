# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
_projectname='psl'
pkgname='python-publicsuffixlist'
pkgver='1.1.2.20261021'
pkgrel='1'
pkgdesc='publicsuffixlist for python'
arch=('any')
url="https://github.com/ko-zu/$_projectname"
license=('MPL-2.0')
depends=('python>=3.8.0' 'python-requests')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-gha.tar.gz")
b2sums=('062540e3547fd863457e5d803ae8ba4c44d9b6e838e2a69a1ffb6bed5be2005405f08312030dd11add9935c30cde37bfeb61aec89c973db9177ff88d6e4a4fa7')

_sourcedirectory="$_projectname-$pkgver-gha"

build() {
	cd "$srcdir/$_sourcedirectory/"
	python -m build --wheel --no-isolation
}

check() {
	cd "$srcdir/$_sourcedirectory/"
	python -m publicsuffixlist.test
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
}
