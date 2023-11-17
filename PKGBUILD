# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dario Pellegrini <pellegrini.dario at gmail dd0f5c4e.diffot com>

pkgname=python-imapclient
_pkgname=IMAPClient
_pkg="${pkgname#python-}"
pkgver=3.0.0
_commit=a3abfea6d1ce68f464a8a9fcef81af3a914b1b4d
_com="${_commit::7}"
pkgrel=1
pkgdesc="Easy-to-use, Pythonic and complete IMAP client library"
arch=('any')
url="https://github.com/mjs/imapclient"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_com.tar.gz")
sha256sums=('dd29b447ce7188f75a0c9a708a215c6a4c291cf4c9dfc3f6db29913aa99b1298')

build() {
	cd "$_pkg-$_commit"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$_commit"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkgname-$pkgver.dist-info/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
