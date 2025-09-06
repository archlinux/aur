# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=streamlit-aggrid
pkgname=python-$_name
pkgver=1.1.8.post1
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
b2sums=('9df69c56597329b51837238ab6c363c977d5974e20c59c2f597714e05df573a80352a0fbd87c7124c1cbd57a87efd4861054c7c02b389afd3c739e5823ba557d')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
