# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: 261519 <jonathan.j.rayner@gmail.com>
# Contributor: asermax <asermax@gmail.com>

pkgname=kaggle-api
_name=${pkgname%-api}
pkgver=1.8.2
pkgrel=2
pkgdesc='Kaggle API CLI'
arch=('any')
url="https://github.com/Kaggle/kaggle-api"
license=('Apache')
depends=(
  'python'
  'python-urllib3'
  'python-six'
  'python-certifi'
  'python-dateutil'
  'python-requests'
  'python-tqdm'
  'python-slugify'
  'python-bleach'
  'python-protobuf'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('d3945c32ce6f81046592d14f6d233ee1aec92769682fce4b05b3409e086db5f7')

latestver() {
  curl -s "https://pypi.org/pypi/${_name}/json" | jq -r '.info.version'
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
