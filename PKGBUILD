# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=streamlit-aggrid
pkgname=python-$_name
pkgver=1.1.1
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
b2sums=('8ef76c8e01377626f78793d06313a69352cb38d26eca89d78f81d66ee4f3ba8f60ea1f777a2b409cdde89cb4ac7334e7e4b77e76205a70b08de365b12e4b3b44')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
