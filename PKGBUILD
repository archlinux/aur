# Maintainer: Lex Black <autumn-wind@web.de>

_module=drf-spectacular-sidecar
pkgname=python-$_module
pkgver=2025.10.1
pkgrel=1
pkgdesc="Serve self-contained distribution builds of Swagger UI and Redoc with Django"
arch=(any)
url="https://github.com/tfranzel/drf-spectacular-sidecar"
license=('BSD-3-Clause')
depends=(
	'python-django'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-setuptools'
)
source=(
	"${_module}-${pkgver}.tar.gz::https://github.com/tfranzel/${_module}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('65fd9f8661141243f91287e97508c2d848e4b8afc97e69ab447113d21403cef1')


build() {
	cd "$_module-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_module-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/python-drf-spectacular-sidecar/LICENSE"
}
