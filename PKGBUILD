# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=insightface
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.7.3
pkgrel=1
pkgdesc="InsightFace Python Library"
arch=("i686" "x86_64" "aarch64" "armv7h")
url="https://github.com/deepinsight/${_pkgname}"
license=('MIT')
depends=(cython python-albumentations python-easydict python-matplotlib python-numpy python-onnx python-pillow python-prettytable python-requests python-scikit-image python-scikit-learn python-scipy python-tqdm)
makedepends=('cython' 'python-build' 'python-installer' 'python-numpy' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('f191f719612ebb37018f41936814500544cd0f86e6fcd676c023f354c668ddf7')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -dm755 "${pkgdir}/usr/share"
    mv "${pkgdir}/usr/${_pkgname}" "${pkgdir}/usr/share"
}
