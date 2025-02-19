# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="python-marker-pdf"
_name="marker_pdf"
pkgver=1.5.2
pkgrel=1
pkgdesc="Convert PDF to markdown + JSON quickly with high accuracy"
arch=('any')
url="https://pypi.org/project/marker-pdf/"
license=('GPL3')
provides=(python-marker-pdf) #TODO: verify
depends=(
  python-pytorch python-streamlit python-pydantic python-dotenv uvicorn python-fastapi python-multipart python-filetype python-markdown2 python-scikit-learn
  #AUR
  python-pypdfium2 python-pdftext python-google-genai python-ftfy python-surya-ocr python-markdownify
)

optdepends=(python-pytorch-cuda python-pytorch-rocm)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=("$_name-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('53e9ca31cf4ded8655b777d91d8b25d69219936b50c5200ed2a8204a03d7d65e')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --prefix="/usr" --destdir="${pkgdir}" dist/*.whl
}
