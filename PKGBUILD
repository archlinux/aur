# Maintainer: Max Backstroem <aur@backstroem.net>
# Contributor: John Hamelink <me@johnhame.link>

pkgname=python-mopidy-tidal
_pkg=Mopidy-Tidal
pkgver=0.3.2
pkgrel=1
pkgdesc='Tidal music service integration'
arch=('any')
url=https://github.com/tehkillerbee/mopidy-tidal
license=('Apache')
depends=('mopidy' 'python-pykka' 'python-tidalapi' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-mock')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/M/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('7a4aa1ccac94d96a9339e451d5949903dc96dd45ec2c1b02d8193a159ad08267')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

## tests currently fail
check() {
	cd "$_pkg-$pkgver"
	PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
