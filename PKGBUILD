# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=insightface
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.1
pkgrel=1
pkgdesc="InsightFace Python Library"
arch=("i686" "x86_64" "aarch64" "armv7h")
url="https://github.com/deepinsight/${_pkgname}"
license=('MIT')
depends=(python-numpy python-onnx python-onnxruntime python-opencv python-requests python-scikit-image python-scipy python-tqdm)
makedepends=('cython' 'python-build' 'python-installer' 'python-numpy' 'python-setuptools' 'python-wheel')
optdepends=("pyside6: for GUI"
            "python-reportlab: for GUI"
            "cython: for face3D"
            "python-albumentations: for face3D")
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('27af24891bbba470cb3573b366a0fcca8989fc8503c9f8f281e8cba6fd716075')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
