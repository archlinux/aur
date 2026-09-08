# Maintainer: orkut
# Contributor: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-markitdown
_pkgname=${pkgname#python-}
pkgver=0.1.7
pkgrel=1
pkgdesc="Utility tool for converting various files to Markdown"
arch=(any)
url="https://github.com/microsoft/markitdown"
license=(MIT)
depends=(
  python
  python-beautifulsoup4
  python-charset-normalizer
  python-defusedxml
  python-magika
  python-markdownify
  python-requests
)
makedepends=(
  python-build
  python-hatchling
  python-installer
)
optdepends=(
  'python-pptx: .pptx support'
  'python-mammoth: .docx support'
  'python-lxml: .docx support'
  'python-pandas: .xlsx and .xls support'
  'python-openpyxl: .xlsx support'
  'python-xlrd: legacy .xls support'
  'python-pdfminer: PDF support'
  'python-pdfplumber: PDF table extraction'
  'python-olefile: Outlook .msg support'
  'python-pydub: audio transcription'
  'python-speechrecognition: audio transcription'
  'python-youtube-transcript-api: YouTube transcripts'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/markitdown/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('94256b82ff6e5b4d7907135a97bbd6313631c372876c43cd8ff13e95385eca56')

_pkgdir="$_pkgname-$pkgver/packages/markitdown"
build() {
  cd "$_pkgdir"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgdir"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim: ts=2 sw=2 et:
