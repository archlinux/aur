# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=napari-deeplabcut
pkgname=python-${_name}
pkgver=0.3.1.1
pkgrel=1
pkgdesc="Keypoint annotation tool for pose estimation"
arch=('any')
url="https://deeplabcut.github.io/DeepLabCut/README.html"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('dcc17cabdc8823a2f28dcf60820988f287f9565f367d85799a988bfbdd42433e')

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
