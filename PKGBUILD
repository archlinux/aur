# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=napari-feature-classifier
pkgname=python-${_name}
pkgver=0.4.3
pkgrel=1
pkgdesc="An interactive classifier plugin to use with label images and feature measurements"
arch=('any')
url="https://github.com/fractal-napari-plugins-collection/napari-feature-classifier"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('10c9a40ed19c00d081d67cdd61aea3071eec62da40c88463827ce1cf8aaf097e')

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
