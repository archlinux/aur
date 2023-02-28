# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dario Pellegrini <pellegrini.dario at gmail dd0f5c4e.diffot com>

pkgname=python-imapclient
_pkgname=IMAPClient
_pkg="${pkgname#python-}"
pkgver=2.3.1
_commit=d0f5c4e927ddda1972066ef04242a09d2dc2a666
_com="${_commit::7}"
pkgrel=1
pkgdesc="Easy-to-use, Pythonic and complete IMAP client library"
arch=('any')
url="https://github.com/mjs/imapclient"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_com.tar.gz")
sha256sums=('130dc944f5f063a32e4f2980e3110947b574266e7fae20873726bdc5079b5e38')

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
