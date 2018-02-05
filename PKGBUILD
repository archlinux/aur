# Maintainer: Sean Haugh <seanphaugh@gmail.com>
_pkgname=pycflow2dot
_owner=johnyf
pkgname=pycflow2dot
pkgver=0.2.1
pkgrel=1
pkgdesc="Layout C call graphs from cflow using GraphViz dot"
arch=('any')
url="https://github.com/$_owner/$_pkgname"
license=('BSD')
depends=('python'
	'python-pydot'
	'python-networkx')
makedepends=('python-setuptools')
provides=("$pkgname=$pkgver-$pkgrel")
source=("https://github.com/$_owner/$_pkgname/archive/v$pkgver.tar.gz"
	'pycflow2dot-0.2.1-fix-install-requires.patch')
md5sums=('bc3be47765e019c4dce0dd4c73444416'
         '69d5c78fb719661f900741f82bfffa64')

prepare() {
	cd "$_pkgname-$pkgver"
	patch -i "${srcdir}/pycflow2dot-0.2.1-fix-install-requires.patch"
}

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim: set ts=2 sw=2 noet:
