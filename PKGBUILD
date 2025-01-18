# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gökçe Aydos <aydos.de>
_base=nbgrader
pkgname=jupyter-${_base}
pkgver=0.9.5
pkgrel=1
pkgdesc="A system for assigning and grading notebooks"
arch=(any)
url=https://github.com/jupyter/${_base}
license=(BSD-3-Clause)
depends=(python-alembic
  python-jinja
  python-jsonschema
  python-jupyter_client
  jupyter-server
  jupyterlab
  python-jupyterlab-server
  jupyter-nbclient
  jupyter-nbconvert
  jupyter-notebook
  python-dateutil
  python-rapidfuzz
  python-requests
  python-sqlalchemy
  python-pyaml)
makedepends=(python-build python-installer python-hatch-jupyter-builder python-wheel npm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('538a34f48666654d7dc16fe4d97ceeb636693dc3025483dcaea5fdb6a3917b86fa291f10b9aedce5e419621af8b533adebe69224b02e6473a90ad98f4d26f5a0')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  mv "$pkgdir"/usr/etc "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
