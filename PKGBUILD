# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=streamlit-aggrid
pkgname=python-$_name
pkgver=1.1.2
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
b2sums=('e20d84e8e1c14223fae47f8c99f90d295ab27de96ed4b053876960c4ae6b55036cc791dd83a68a26357fb3d66004153dc54b059050f62973771615dc5bdd5bb2')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
