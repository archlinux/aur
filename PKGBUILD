# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>

pkgname=python-wikipedia-api
_pkgname=Wikipedia-API
pkgver=0.16.0
pkgrel=1
pkgdesc="Python wrapper for Wikipedia"
arch=('any')
url="https://github.com/martin-majlis/Wikipedia-API"
license=('MIT')
depends=(python python-click python-httpx python-tenacity)
makedepends=(python-installer python-wheel python-build python-hatchling)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/martin-majlis/${_pkgname}/archive/v${pkgver}.tar.gz"
	"fix-readme-name.patch")
sha256sums=('31d4d230a3313af935e76b8117b70960d21cd1f3f4240995c9a287a65606db4c'
            '0a3affca8fc295aaa24d7043abc64337f072647f11e52ee57931d5c7894f626e')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	patch -p0 -i ../fix-readme-name.patch
}


build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
