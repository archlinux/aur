# Maintainer: dreieck
# Contributor: Kirill Gagarski

_pkgver=3.1.2
_pkgname=antlr3
pkgname="${_pkgname}-${_pkgver}"
_shortname=${_pkgname:0:-1}
pkgver="${_pkgver}"
pkgrel=3
pkgdesc="ANTLR3 version ${_pkgver}. A parser generator for reading, processing, executing, or translating structured text or binary files."
arch=('any')
url='https://www.antlr3.org/index.html'
license=('BSD')
depends=('java-environment>=6')
optdepends=(
  "python2-antlr3=${_pkgver}: For the corresponding python2 runtime."
)
provides=(
  "antlr=${pkgver}"
  "antlr3=${pkgver}"
)
conflicts=(
  "antlr3"
)
source=(
  "https://www.antlr3.org/download/${_shortname}-${pkgver}.jar"
  'antlr3'
  "https://www.antlr3.org/download/Python/antlr_python_runtime-${pkgver}.tar.gz" # Used for the license file.
)
noextract=("${_shortname}-${pkgver}-complete.jar")

sha256sums=(
  '0f0c07c499a2ab95ebc71b8e3140f2041cd524dcebfe220321e07c864a3e24bd'
  'ede2ad1581b2e15edb2f96ecf33bbcc5372d24baa051c24c68cf5ebddf302268'
  'd838ce44d24e8815c9dcd123af045161d7db7157873907b85b1c7fe9f1c2d5db'
)

_cmd() {
  # Prints out what to be run to stdout, and then executes it.
  # The command and it's arguments is passed as argument(s).

  printf '%s' '> '; cat <<< "$@"
  "$@"
}


package() {
  cd "${srcdir}"

  _cmd install -D -m644 "${_shortname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_shortname}-${pkgver}.jar"
  _cmd ln -s "${_shortname}-${pkgver}.jar" "${pkgdir}/usr/share/java/antlr3.jar"
  _cmd ln -s "${_shortname}-${pkgver}.jar" "${pkgdir}/usr/share/java/antlr3-complete.jar"
  _cmd ln -s "${_shortname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_shortname}-${pkgver}-complete.jar"
  _cmd install -D -m755 antlr3 "${pkgdir}"/usr/bin/antlr3

  _cmd install -D -m644 "${srcdir}/antlr_python_runtime-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
