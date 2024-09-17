# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Gökçe Aydos <aydos.de>
_base=nbgrader
pkgname=jupyter-${_base}
pkgver=0.9.3
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
sha512sums=('3e298ad1bca529f0e708fd4561173ea5fa60a90d5ff8e62714549d1a38b643c17e1120c39fb85dffe34e1ce6caad6fb2839f28f118c844b5bd8a005f33e8520c')

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
