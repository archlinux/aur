# Maintainer: enihcam <enihcam@archlinux>
# Contributor: Zirui Guo <guozirui@hku.hk>
#
# NOTE: This package has PyPI-only transitive dependencies (lightrag-hku and
# mineru each bring their own unlisted PyPI deps). Install with pip:
#   pip install --user nano-vectordb pipmaster pypinyin uvicorn \
#     onnxruntime fast-langdetect mineru-vl-utils pypptx-with-oxml ftfy
#
# WARNING: RAG-Anything requires lightrag-hku<1.5 but only v1.5.4 is
# available. The constraint may need updating in pyproject.toml, or pin
# lightrag-hku to an older version.

pkgname=python-raganything
pkgver=1.3.1
pkgrel=1
pkgdesc='RAGAnything: All-in-One RAG System'
arch=('any')
url='https://github.com/HKUDS/RAG-Anything'
license=('MIT')
depends=(
    'python'
    'python-huggingface-hub'
    'python-lightrag-hku'
    'python-mineru'
    'python-tqdm'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-pillow: Image format conversion support'
    'python-reportlab: Text file to PDF conversion'
    'python-pypdfium2: PDF rendering for OCR'
    'python-paddleocr: Scanned PDF OCR support'
    'python-markdown: Enhanced markdown conversion'
    'python-weasyprint: HTML/PDF rendering for markdown'
    'python-pygments: Syntax highlighting'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/HKUDS/RAG-Anything/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('SKIP')

build() {
    cd "RAG-Anything-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "RAG-Anything-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
