# Maintainer: Philipp A. <flying-sheep@web.de>

_name=alembic-autogenerate-enums
pkgname=python-$_name
pkgver=0.1.2
pkgrel=1
pkgdesc='Alembic hook that causes --autogenerate to output PostgreSQL ALTER TYPE statements.'
arch=(any)
url="https://github.com/dw/$_name"
license=(MIT)
depends=(python python-alembic python-sqlalchemy)
makedepends=(python-poetry-core python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('467adc76f1ef32576e514ef55c400c28900547800b676dec349293519751c128')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
