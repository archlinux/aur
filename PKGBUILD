# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: 261519 <jonathan.j.rayner@gmail.com>
# Contributor: asermax <asermax@gmail.com>

pkgname=kaggle-api
_name=${pkgname%-api}
pkgver=2.2.2
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
sha256sums=('c35ec93f851f7253e2ae04ea1e24aedb8afd44551a7e7f721463fd6dc2256e21')

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
