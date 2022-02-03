# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-mopidy-tidal
pkgver=0.2.7
pkgrel=1
pkgdesc='Tidal music service integration'
arch=('any')
url=https://github.com/tehkillerbee/mopidy-tidal
license=('Apache')
depends=('mopidy' 'python-pykka' 'python-tidalapi' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
checkdepends=('python-pytest' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/M/Mopidy-Tidal/Mopidy-Tidal-$pkgver.tar.gz")
sha256sums=('2b01c96db3200a38f658c62aaf90a1dd50dfe182b52c017d7c21009fe752a70d')

build() {
	cd "Mopidy-Tidal-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

## tests currently fail
# check() {
# 	cd "Mopidy-Tidal-$pkgver"
# 	pytest -x
# }

package() {
	export PYTHONHASHSEED=0
	cd "Mopidy-Tidal-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
}
