# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-markitdown
_pkgname=${pkgname#python-}
pkgver=0.1.3
pkgrel=1
pkgdesc="Utility tool for converting various files to Markdown"
arch=(any)
url="https://github.com/microsoft/markitdown"
license=(MIT)
depends=(
  python
  python-beautifulsoup4
  python-requests
  python-mammoth
  python-markdownify
  python-numpy
  python-pptx
  python-pandas
  python-openpyxl
  python-pdfminer
  python-puremagic
  python-pydub
  python-youtube-transcript-api
  python-speechrecognition
  python-pathvalidate
  python-cobble #not requested in pyproject.toml but apparently needed at runtime
  python-olefile
  python-magika
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-hatch
)
#source=("https://files.pythonhosted.org/packages/14/d8/e23bd08cd9749cb16ec5832a9e02d5f715efe2c7fc7e2637afaf41df2eee/${_pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/markitdown/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('613182b011dbd4dab12d455a9c09059cbe011bf3c495ee690e7c57c385cb9c69')

_pkgdir="$_pkgname-$pkgver/packages/markitdown/"
build() {
  cd "$_pkgdir"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgdir"
  #  python -m pytest # no test files yet
}

package() {
  cd "$_pkgdir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 ../../LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim: ts=2 sw=2 et:
# vim:set ts=2 sw=2 et:
