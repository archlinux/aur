# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-markitdown
_pkgname=${pkgname#python-}
pkgver=0.0.1a2
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
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("https://files.pythonhosted.org/packages/14/d8/e23bd08cd9749cb16ec5832a9e02d5f715efe2c7fc7e2637afaf41df2eee/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('b4fb8234e01f743d9a31c5191ae446ccf8220b17ee90598323b185c145faa407')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  #  python -m pytest # no test files yet
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
# vim: ts=2 sw=2 et:
# vim:set ts=2 sw=2 et:
