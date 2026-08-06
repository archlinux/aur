# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=python-sqladmin
_pkgname=${pkgname#python-}
pkgver=0.31.0
pkgrel=1
pkgdesc="SQLAlchemy Admin for FastAPI and Starlette"
arch=("any")
url="https://smithyhq.github.io/sqladmin/"
license=("BSD-3-Clause")
depends=(python python-starlette python-jinja python-wtforms python-python-multipart python-sqlalchemy)
makedepends=(python-build python-uv-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.zip::https://github.com/smithyhq/sqladmin/archive/refs/tags/$pkgver.zip")
sha256sums=('e8a087f2012b307798b983d23fac732a3c886dd58c8fe3983bd14d6be512a44b')

build() {
	cd $srcdir/${_pkgname}-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd ${_pkgname}-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
