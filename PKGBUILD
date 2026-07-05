# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=python-sqladmin
_pkgname=${pkgname#python-}
pkgver=0.28.0
pkgrel=1
pkgdesc="SQLAlchemy Admin for FastAPI and Starlette"
arch=("any")
url="https://smithyhq.github.io/sqladmin/"
license=("BSD-3-Clause")
depends=(python python-starlette python-jinja python-wtforms python-python-multipart python-sqlalchemy)
makedepends=(python-build python-uv-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.zip::https://github.com/smithyhq/sqladmin/archive/refs/tags/$pkgver.zip")
sha256sums=('0e1eb86690b36623ed49552f510fc3e92f5e677a4174f9440f5e3dd9affb9c0c')

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
