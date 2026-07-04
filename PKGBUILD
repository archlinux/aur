# Maintainer: enihcam <enihcam@archlinux>
# Contributor:

pkgname=python-paddleocr
_pkgname=paddleocr
pkgver=3.7.0
pkgrel=1
pkgdesc='Awesome multilingual OCR and document parsing toolkits based on PaddlePaddle'
arch=('any')
url='https://github.com/PaddlePaddle/PaddleOCR'
license=('Apache-2.0')
depends=(
    'python'
    'python-aiohttp'
    'python-requests'
    'python-typing_extensions'
    'python-yaml'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
optdepends=(
    'python-docx: DOCX export support (doc2md extra)'
    'python-openpyxl: XLSX export support (doc2md extra)'
    'python-pylatexenc: LaTeX encoding support (doc2md extra)'
    'python-pptx: PPTX export support (doc2md extra)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/PaddlePaddle/PaddleOCR/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('SKIP')

build() {
    cd "PaddleOCR-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "PaddleOCR-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
