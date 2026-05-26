# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>

pkgname=python-wikipedia-api
_pkgname=Wikipedia-API
pkgver=0.15.0
pkgrel=1
pkgdesc="Python wrapper for Wikipedia"
arch=('any')
url="https://github.com/martin-majlis/Wikipedia-API"
license=('MIT')
depends=(python python-click python-httpx python-tenacity)
makedepends=(python-installer python-wheel python-build python-hatchling)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/martin-majlis/${_pkgname}/archive/v${pkgver}.tar.gz"
	"fix-readme-name.patch")
sha256sums=("78ff45feed951f91fdc2183ff533f0a5bed6560e5091b38200ba4ac068fa33df"
	"SKIP")

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
