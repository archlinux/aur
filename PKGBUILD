# Maintainer: M. Backstroem <aur@backstroem.net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-mopidy-tidal
_pkg=mopidy_tidal
pkgver=0.3.4
pkgrel=2
pkgdesc='Tidal music service integration'
arch=('any')
url=https://github.com/tehkillerbee/mopidy-tidal
license=('Apache')
depends=('mopidy' 'python-pykka' 'python-tidalapi' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('3fcd94a2a06dbd0f942f3f1ba8ea485a2b00d5576601389504fa64bdce949ee3')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

## tests currently fail
## mybe add tests back on next release
#check() {
#	cd "$_pkg-$pkgver"
#	PYTHONPATH="$PWD" pytest -x --disable-warnings
#}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
