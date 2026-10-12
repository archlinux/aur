# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gökçe Aydos <aydos.de>
_base=nbgrader
pkgname=jupyter-${_base}
pkgver=0.9.6
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
sha512sums=('3f27c011708e9d39d899813d19ca8a59a7a078e4936b3de5c0e242fabb9166ab1d6f8b983e9ae9543d3751796048a1c2f9288d29538c6f3539381560862af10c')

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
