# Maintainer: a821
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-tidalapi
_name=${pkgname#python-}
pkgver=0.7.5
pkgrel=2
pkgdesc='Unofficial API for TIDAL music streaming service.'
arch=('any')
url='https://github.com/tamland/python-tidal'
license=('LGPL-3.0-only')
depends=('python-requests' 'python-dateutil' 'python-isodate' 'python-mpegdash')
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('433ac8590edc5a93c0bb7fbfcea02a5fd78358e17c1775e3f11b790fc23a87d3')

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
