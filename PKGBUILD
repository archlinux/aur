# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkg='olefile'
pkgname="python2-$_pkg"
pkgver='0.46'
pkgrel='5'
pkgdesc='Python library to parse, read and write Microsoft OLE2 files'
arch=('any')
url='https://github.com/decalage2/olefile'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
replaces=('python2-olefileio')
conflicts=('python2-olefileio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('11d1a3810e50956c9360a4c76f1ecebf3e54f9d8406f75127bd0d296638488f4')

build() {
	cd "$_pkg-$pkgver"
	python2 setup.py build
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'README.md' 'doc/'*'.rst' -t "$pkgdir/usr/share/doc/$pkgname"
}
