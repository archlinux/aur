# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-cleanurl
_pkg="${pkgname#python-}"
pkgver=0.1.12
pkgrel=1
pkgdesc="Removes clutter from URLs"
arch=('any')
url="https://github.com/xojoc/cleanurl"
license=('AGPL3')
depends=('python>=3.9')
makedepends=('python-poetry-core' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('935d1f99dc4ea162cbd075f3196c9a41cf4a94472203ac3a5bbff3c299afcea2')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
