# Maintainer: a821 at (nospam) mail de
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-tidalapi
_name=${pkgname#python-}
pkgver=0.8.4
pkgrel=1
pkgdesc='Unofficial API for TIDAL music streaming service.'
arch=('any')
url='https://github.com/tamland/python-tidal'
license=('LGPL-3.0-or-later')
depends=('python-requests' 'python-dateutil' 'python-isodate' 'python-mpegdash')
makedepends=('python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4afb80cef4ac733456c4b8e3cd3ecfc3475bfa1d6453c50549706f27e615ee8c')

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
