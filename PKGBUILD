# Maintainer: Hsiu-Ming Chang <cges30901 at gmail dot com>
# Contributor: Ruikai Liu <lrk700 at gmail dot com>
# Contributor: Alexander Kobel <a-kobel at a-kobel dot de>

pkgname=('python-pymupdf')
_name='PyMuPDF'
pkgver=1.17.5
pkgrel=1
pkgdesc='Python bindings for MuPDF'
arch=('x86_64')
url='https://github.com/pymupdf/PyMuPDF'
license=('AGPL3')
depends=('python' 'libjpeg-turbo' 'jbig2dec' 'openjpeg2'  'freetype2')
makedepends=('python-setuptools' 'libmupdf-pymupdf>=1.17' 'libmupdf-pymupdf<1.18')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-${pkgver}.tar.gz")
sha256sums=('ddec02c4dd1c2e0ead4d61cd97b52e725d643602f1f7832b5016190f5c653add')

prepare() {
  cd "${_name}-${pkgver}"
}

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" python -c 'import sys; sys.path.remove(""); import fitz'
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
