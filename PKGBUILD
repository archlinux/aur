# Maintainer: dreieck

_pkgname=python2-antlr3
pkgname="${_pkgname}"
pkgdesc='ANTLR3 runtime for Python'
pkgver=3.1.3
pkgrel=4
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
source=(
  "https://www.antlr3.org/download/Python/antlr_python_runtime-${pkgver}.tar.gz"
)
sha256sums=(
  'e6ac1e5aaae4e2d9ead03d13142cca61447bdfa6a66c7552cb884c43e688532c'
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
