# Maintainer: Agil Mammadov <mammadovagil at tutamail dot com>
pkgname=python-aesqlapius
_name=${pkgname#python-}
pkgver=0.0.9
pkgrel=2
pkgdesc="Manage SQL queries as a Python API"
arch=('any')
url="https://github.com/AMDmi3/aesqlapius"
license=('MIT')
depends=('python' 'python-aiopg' 'python-asyncpg')
makedepends=('python-installer' 'python-build' 'python-wheel')
checkdepends=('pytest')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AMDmi3/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a159ed6b32cc6c5acdb63ce181ff5937d091bbe6b5b05149dd5c526739e6a9cc')

build() {
	cd "$srcdir/$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
