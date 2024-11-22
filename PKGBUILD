# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gökçe Aydos <aydos.de>
_base=nbgrader
pkgname=jupyter-${_base}
pkgver=0.9.4
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
sha512sums=('4284a37e9092f5d1d306da200021458ea09b276c828141ca0c1acef1a2496af7427cc254e4d67d2f892c417d17c750b9be32d824bc50729d5e551e76affc3f29')

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
