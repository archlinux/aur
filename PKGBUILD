# Maintainer: enihcam <enihcam@archlinux>
#
# NOTE: MinerU[core] has PyPI-only runtime dependencies that pacman cannot
# satisfy. Install them with pip before use:
#   pip install --user uvicorn onnxruntime fast-langdetect mineru-vl-utils pypptx-with-oxml ftfy
#
# ML extras (vlm/pipeline/gradio: torch, transformers, accelerate, gradio)
# are also PyPI-only -- install manually if needed:
#   pip install --user torch transformers accelerate gradio

pkgname=python-mineru
_pkgname=mineru
pkgver=3.4.2
pkgrel=1
pkgdesc='A practical document parsing tool for converting PDF, images, DOCX, PPTX, and XLSX into Markdown and JSON'
arch=('any')
url='https://github.com/opendatalab/MinerU'
license=('custom:MinerU')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-click'
    'python-fastapi'
    'python-httpx'
    'python-huggingface-hub'
    'python-json-repair'
    'python-loguru'
    'python-lxml'
    'python-magika'
    'python-numpy'
    'python-openai'
    'python-opencv'
    'python-openpyxl'
    'python-pillow'
    'python-pyclipper'
    'python-pycryptodome'
    'python-pylatexenc'
    'python-pypdf'
    'python-pypdfium2'
    'python-docx'
    'python-python-multipart'
    'python-yaml'
    'python-reportlab'
    'python-requests'
    'python-safetensors'
    'python-shapely'
    'python-tqdm'
    'python-modelscope'
    'python-pdftext'
    'python-mammoth'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-pytorch: VLM inference & pipeline'
    'python-transformers: VLM inference & pipeline'
    'python-accelerate: VLM inference acceleration'
    'python-torchvision: Pipeline OCR'
    'python-gradio: Gradio web interface'
    'python-boto3: S3 storage support'
)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/opendatalab/MinerU/archive/refs/tags/$_pkgname-$pkgver-released.tar.gz")
b2sums=('SKIP')

build() {
    cd "MinerU-$_pkgname-$pkgver-released"
    python -m build --wheel --no-isolation
}

package() {
    cd "MinerU-$_pkgname-$pkgver-released"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
