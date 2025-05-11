# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=streamlit-aggrid
pkgname=python-$_name
pkgver=1.1.4.post1
pkgrel=1
pkgdesc="A Streamlit component for the AG Grid JavaScript library"
arch=(any)
url="https://pypi.org/project/streamlit-aggrid"
license=(MIT)
depends=(
  python
  python-decouple
  python-numpy
  python-pandas
  python-simplejson
  python-streamlit
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
# No releases or tags on GitHub :-(
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
b2sums=('151fa4b53b96c1340ab8853fa1b58b37be0c78d8132c0d5d928a3f17a10221dc277fe3593522ddb382419cf73ef12af5280329df9eb52675ee459a6bb744d197')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
