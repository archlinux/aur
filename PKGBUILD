# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-flask-sqlalchemy-lite
_pkgname=flask-sqlalchemy-lite
pkgver='0.2.1'
pkgrel=3
pkgdesc="Integrate SQLAlchemy with Flask"
url="https://flask-sqlalchemy-lite.readthedocs.io"
depends=(python-flask python-sqlalchemy python-asgiref)
checkdepends=(python-aiosqlite python-pytest)
makedepends=(python-build python-flit-core python-installer python-wheel)
license=(MIT)
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pallets-eco/flask-sqlalchemy-lite/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3df9f83b94b6cbd6d74667180615f38062f67002ffa31779f48e8baf34388f69')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build -wnx
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

check() {
    cd "${_pkgname}-${pkgver}"
    PYTHONPATH=src pytest tests
}
