# Maintainer: dreieck

_pkgver=3.1.2
_pkgname="python2-antlr3-${_pkgver}"
pkgname="${_pkgname}"
pkgdesc="ANTLR3 runtime for Python, version ${_pkgver}"
pkgver="${_pkgver}"
pkgrel=2
arch=('any')
url="http://www.antlr3.org/"
license=('BSD')
depends=(
  'antlr3'
  'python2'
)
makedepends=(
  'python2-setuptools'
)
provides=("python2-antlr3=${pkgver}")
conflicts=("python2-antlr3")
source=(
  "https://www.antlr3.org/download/Python/antlr_python_runtime-${pkgver}.tar.gz"
)
sha256sums=(
  'd838ce44d24e8815c9dcd123af045161d7db7157873907b85b1c7fe9f1c2d5db'
)

_cmd() {
  # Prints out what to be run to stdout, and then executes it.
  # The command and it's arguments is passed as argument(s).

  printf '%s' '> '; cat <<< "$@"
  "$@"
}

package() {
  cd "${srcdir}/antlr_python_runtime-${pkgver}"

  _cmd python2 setup.py install --root="${pkgdir}" --optimize=1

  for _docfile in 'AUTHORS' 'PKG-INFO' 'README'; do
    _cmd install -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname}/${_docfile}"
  done

  _cmd install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
