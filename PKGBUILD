# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-cython_bbox"
pkgver=1.0.0
pkgrel=5
pkgdesc='cython_bbox is widely used in object detection tasks. It is implemented in almost all object detection projects.'
arch=(any)
url="https://github.com/samson-wang/cython_bbox"
license=(MIT)
depends=(python cython python-numpy)
conflicts=()
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(cython_bbox-master.zip::"$url/archive/refs/heads/master.zip")
sha256sums=('a071ea8341810e7a047a0730084aa16e1f6b2f4c2d4c4ba04f129569c501812c')

build() {
  cd "${srcdir}/cython_bbox-master"
  sed -i '12c DTYPE = float' src/cython_bbox.pyx
  python -m build --wheel --skip-dependency-check --no-isolation
}

package(){
  depends+=()
  cd "${srcdir}/cython_bbox-master"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
