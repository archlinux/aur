# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-eciespy
_pkg="${pkgname#python-}"
pkgver=0.3.12
pkgrel=1
pkgdesc="Elliptic curve integrated encryption scheme for secp256k1"
arch=('any')
url="https://github.com/ecies/py"
license=('MIT')
depends=('python-coincurve' 'python-eth-keys' 'python-pycryptodome')
makedepends=('python-poetry-core' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/e/eciespy/eciespy-$pkgver.tar.gz")
sha256sums=('4702135fa24971d96ebef04806e342bbbc6e3a809ba99afea8dc5a5aff8f275d')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
