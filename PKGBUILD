# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: 261519 <jonathan.j.rayner@gmail.com>
# Contributor: asermax <asermax@gmail.com>

pkgname=kaggle-api
_name=${pkgname%-api}
pkgver=2.0.2
pkgrel=1
pkgdesc='Kaggle API CLI'
arch=('any')
url="https://github.com/Kaggle/kaggle-api"
license=('Apache')
depends=(
  'python'
  'python-urllib3'
  'python-dateutil'
  'python-requests'
  'python-tqdm'
  'python-slugify'
  'python-bleach'
  'python-protobuf'
  'python-packaging'
  'python-kagglesdk'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('fba1bc09053e7a370c7c500cc4821e3e0901cf289c5096bbb799fbf1ed53cdb7')

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
