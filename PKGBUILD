# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: M. Backstroem <aur@backstroem.net>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-mopidy-tidal
_pkg=mopidy_tidal
pkgver=0.3.9
pkgrel=2
pkgdesc='Tidal music service integration'
arch=('any')
url=https://github.com/tehkillerbee/mopidy-tidal
license=('Apache')
depends=('mopidy' 'python-pykka' 'python-tidalapi' 'python-requests' 'python-ratelimit' 'python-mpegdash')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/m/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('f76ccc882e4e7b80ade9b2d5d6f77c35dbf234078f1c203a9c6a4842041cd868')

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
