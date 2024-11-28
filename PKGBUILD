# Maintainer: a821 at (nospam) mail de
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-tidalapi
_name=${pkgname#python-}
pkgver=0.8.2
pkgrel=1
pkgdesc='Unofficial API for TIDAL music streaming service.'
arch=('any')
url='https://github.com/tamland/python-tidal'
license=('LGPL-3.0-or-later')
depends=('python-requests' 'python-dateutil' 'python-isodate' 'python-mpegdash')
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9eab07291f92f506694b6d326dd1e6651349eaa71597cef634a62915312db38c')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

## tests require an active Tidal session

package() {
	export PYTHONHASHSEED=0
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.rst HISTORY.rst -t "$pkgdir/usr/share/doc/$pkgname"
}
