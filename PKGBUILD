# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=python-sqladmin
_pkgname=${pkgname#python-}
pkgver=0.26.0
pkgrel=1
pkgdesc="SQLAlchemy Admin for FastAPI and Starlette"
arch=("any")
url="https://smithyhq.github.io/sqladmin/"
license=("BSD-3-Clause")
depends=(python python-starlette python-jinja python-wtforms python-python-multipart python-sqlalchemy)
makedepends=(python-build python-uv-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.zip::https://github.com/smithyhq/sqladmin/archive/refs/tags/$pkgver.zip")
sha256sums=('bb4607f4cbab4904088180baea8c52402db9622418af9822a3b8c94a0b8e75ed')

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
