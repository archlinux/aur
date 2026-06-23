# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=tables
pkgname=python-${_name}
pkgver=3.11.1
pkgrel=1
pkgdesc="Hierarchical datasets for Python"
arch=('any')
url="https://www.pytables.org/"
license=('MIT')
depends=('python')
makedepends=('python-blosc2' 'blosc2' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('78abcf413091bc7c1e4e8c10fbbb438d1ac0b5a87436c5b972c3e8253871b6fb')

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
