# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=banks
pkgname=python-${_name}
pkgver=2.4.3
pkgrel=1
pkgdesc="LLM prompt language based on Jinja"
arch=('any')
url="https://github.com/masci/banks"
license=('MIT')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('07ae40dd08577857830428ba77ead477fe62fbb13e26d567635b880c88f50e81')

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
