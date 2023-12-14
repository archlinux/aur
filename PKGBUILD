# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dario Pellegrini <pellegrini.dario at gmail dd0f5c4e.diffot com>

pkgname=python-imapclient
_pkgname=IMAPClient
_pkg="${pkgname#python-}"
pkgver=3.0.1
_commit=9a6a0df2d8d44c1f3d57c222d234740f8d381395
_com="${_commit::7}"
pkgrel=1
pkgdesc="Easy-to-use, Pythonic and complete IMAP client library"
arch=('any')
url="https://github.com/mjs/imapclient"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_com.tar.gz")
sha256sums=('ef38b9fe03c1a1099b132e11da04868e217dde343686dfa5af5f6ccb7b85db3d')

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
