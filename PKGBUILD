# Maintainer: Youcef NAFA <youcef.nafa at gmail>

_name=deeplabcut
pkgname=python-${_name}
pkgver=3.0.0
pkgrel=1
pkgdesc="Markerless pose-estimation of user-defined features with deep learning"
arch=('any')
url="https://deeplabcut.github.io/DeepLabCut/README.html"
license=('MIT')
depends=('python' 'python-albumentationsx' 'python-dlclibrary' 'python-einops' 'python-filterpy' 'python-imgaug' 'python-numba' 'python-pycocotools' 'python-scikit-image' 'python-statsmodels' 'python-tables' 'python-timm' 'pytorch' 'python-torchvision' 'python-qdarkstyle' 'python-dlclibrary' 'python-napari-deeplabcut' 'napari')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('66eb56d0634460bf9e4dc7e87f4f52d920b3ffe4dadd65ed07b5d025e630c3b8')

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
