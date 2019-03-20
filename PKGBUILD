# Maintainer: dreieck

_pkgname=python2-antlr3-3.0.1
pkgname="${_pkgname}"
pkgdesc='ANTLR3 runtime for Python, version 3.0.1'
pkgver=3.0.1
pkgrel=3
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
  'a14c76c51961802a147d7b46ff3a6b1ce8c18901fb086bf50bb41a9e1cc5b125'
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
