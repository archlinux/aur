# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=dlclibrary
pkgname=python-${_name}
pkgver=0.0.12
pkgrel=1
pkgdesc="Lightweight library supporting universal functions for the DeepLabCut ecosystem"
arch=('any')
url="https://github.com/DeepLabCut/DLClib"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('9c1dcb98edcba03f33c31e0c0f9d18ce1c349bef65f8d3cd5bde49d5e76171db')

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
