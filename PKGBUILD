# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=python-sqladmin
_pkgname=${pkgname#python-}
pkgver=0.32.0
pkgrel=1
pkgdesc="SQLAlchemy Admin for FastAPI and Starlette"
arch=("any")
url="https://smithyhq.github.io/sqladmin/"
license=("BSD-3-Clause")
depends=(python python-starlette python-jinja python-wtforms python-python-multipart python-sqlalchemy)
makedepends=(python-build python-uv-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.zip::https://github.com/smithyhq/sqladmin/archive/refs/tags/$pkgver.zip")
sha256sums=('998be4d83cdc2b0e0829ebb0cf8621178b310672c6c03fb7cdf97f17ccfe7024')

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
