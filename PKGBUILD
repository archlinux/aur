# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=banks
pkgname=python-${_name}
pkgver=2.3.0
pkgrel=1
pkgdesc="LLM prompt language based on Jinja"
arch=('any')
url="https://github.com/masci/banks"
license=('MIT')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/masci/banks/archive/refs/tags/v2.3.0.tar.gz")
sha256sums=('b53afd4996dd3a2e4f64e99c048faaece1d703a2b0be77afc88ee4731b0613e5')

build() {
    cd "${srcdir}"/${_name//-/_}-${pkgver}
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  #test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
