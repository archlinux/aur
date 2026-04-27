# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>
pkgname=python-graspologic
_name=${pkgname#python-}
pkgver=3.4.4
pkgrel=1
pkgdesc="A set of Python modules for graph statistics"
arch=('any')
url="https://github.com/graspologic-org/graspologic"
license=('MIT')
depends=(
  'python'
  'python-anytree'
  'python-beartype'
  'python-future'
  'python-gensim'
  'python-graspologic-native'
  'python-hyppo'
  'python-joblib'
  'python-matplotlib'
  'python-networkx'
  'python-numpy'
  'python-pot'
  'python-scikit-learn'
  'python-scipy'
  'python-seaborn'
  'python-statsmodels'
  'python-typing_extensions'
  'python-umap-learn'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-poetry-dynamic-versioning'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('79878caf367da3e89046a4ec94291c5b1a5da569f19fdd879d8b45c3563d7110')

prepare() {
  cd "${_name}-${pkgver}"
  sed -i 's/<3.13//g' pyproject.toml
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
