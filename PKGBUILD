# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>
# Contributor: 0fflineuser <0fflineuser [AT] cock [DOT] li>

pkgname=python-marker-pdf
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="Convert documents to markdown, JSON, chunks, and HTML quickly and accurately"
arch=('any')
url="https://github.com/datalab-to/marker"
license=('Apache-2.0')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-click'
  'python-dotenv'
  'python-filetype'
  'python-ftfy'
  'python-google-genai'
  'python-markdown2'
  'python-markdownify'
  'python-numpy'
  'python-openai'
  'python-opencv'
  'python-pdftext'
  'python-pillow'
  'python-psutil'
  'python-pydantic'
  'python-pydantic-settings'
  'python-pypdfium2'
  'python-pytorch'
  'python-rapidfuzz'
  'python-regex'
  'python-requests'
  'python-scikit-learn'
  'python-six'
  'python-surya-ocr'
  'python-tqdm'
)
optdepends=(
  'python-ebooklib: EPUB input'
  'python-mammoth: DOCX input'
  'python-openpyxl: XLSX input'
  'python-pptx: PPTX input'
  'python-weasyprint: HTML, DOCX, XLSX, PPTX and EPUB input'

  'python-fastapi: marker_server'
  'python-python-multipart: marker_server file uploads'
  'python-streamlit: marker_gui'
  'uvicorn: marker_server'

  'ollama: local Ollama LLM service'
  'python-anthropic: Claude LLM service'

  'docker: NVIDIA vLLM inference backend'
  'llama-cpp: llama.cpp inference backend'
  'nvidia-container-toolkit: NVIDIA vLLM GPU support'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('7f6f0ebd29908f7c7c66f61cc06a9c07a9e3cd612c00732016f6e6b6fc150f7c')

prepare() {
  # Fix extracted directory name
  mv "${_name//-/_}-${pkgver}" "${_name}-${pkgver}"
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" --prefix=/usr dist/*.whl
}
