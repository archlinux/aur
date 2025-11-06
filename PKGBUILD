# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=streamlit-aggrid
pkgname=python-$_name
pkgver=1.2.0.post1
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
b2sums=('6b7c22ecf9fd55bf028f4a13e7373607970eb0afbeb9512a24628d979bac025ec1653b95c468556680a186531402f5a1d9a241e5c72e79536ebe2a69a2103686')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
