# Maintainer: enihcam <enihcam@archlinux>
# Contributor:

pkgname=python-paddleocr
_pkgname=paddleocr
pkgver=3.7.0
pkgrel=2
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
sha256sums=('8e5f1f9ba18c29621d38394b4f72925960640b315281391c3b3c86804f079a73')

prepare() {
    cd "PaddleOCR-$pkgver"
    # Relax strict setuptools pin (==72.1.0 -> >=72.1.0) to work with Arch's newer python-setuptools
    sed -i 's/"setuptools==72\.1\.0"/"setuptools>=72.1.0"/' pyproject.toml
}

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
