# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
_projectname='psl'
pkgname='python-publicsuffixlist'
pkgver='1.1.2.20261029'
pkgrel='1'
pkgdesc='publicsuffixlist for python'
arch=('any')
url="https://github.com/ko-zu/$_projectname"
license=('MPL-2.0')
depends=('python>=3.8.0' 'python-requests')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-gha.tar.gz")
b2sums=('86f78ed2eb457ccfce6ad4d278842e10f687dc76c03ce884b5c64889c898f3b3f6cab9aa82b14651665fa7b47ab35286576d6548ec38ee82d4a1f89d964104a1')

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
