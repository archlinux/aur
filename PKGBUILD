# Maintainer: dreieck

_pkgname='rainbowcrack'
pkgname="${_pkgname}-bin"
pkgver=1.6.1
pkgrel=1
pkgdesc="A general propose implementation of Philippe Oechslin's faster time-memory trade-off technique. It crack hashes with rainbow tables."
url='http://project-rainbowcrack.com/'
arch=('i686' 'x86_64')
license=(custom)

depends=(
)

depends_x86_64=(
)

makedepends=(
)

optdepends=(
)

provides=(
  "${_pkgname}=${pkgver}"
)

replaces=(
  "${_pkgname}<=${pkgver}"
)

conflicts=(
  "${_pkgname}"
)

_docs=(
  http://project-rainbowcrack.com/documentation.htm
  http://project-rainbowcrack.com/crack.htm
  http://project-rainbowcrack.com/generate.htm
  http://project-rainbowcrack.com/convert.htm
  http://project-rainbowcrack.com/charset.htm
  http://project-rainbowcrack.com/alglib.htm
  http://project-rainbowcrack.com/file_format.htm
  http://project-rainbowcrack.com/crack.pdf
  http://project-rainbowcrack.com/generate.pdf
  http://project-rainbowcrack.com/convert.pdf
  http://project-rainbowcrack.com/charset.pdf
  http://project-rainbowcrack.com/alglib.pdf
  http://project-rainbowcrack.com/file_format.pdf
)

_docs_sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

source=()

source_i686=(
  "http://project-rainbowcrack.com/rainbowcrack-${pkgver}-linux32.zip"
  "${_docs[@]}"
)

source_x86_64=(
  "http://project-rainbowcrack.com/rainbowcrack-${pkgver}-linux64.zip"
  "${_docs[@]}"
)

sha256sums=()

sha256sums_i686=(
  82783f99a551209f869737369e5067a4e7a01681cec5822d3f7896cea11cb41f
  "${_docs_sums[@]}"
)

sha256sums_x86_64=(
  df55af9e48cc72bf4214546a6645ce79c850ee3c149161cfe2141de4edc56cd3
  "${_docs_sums[@]}"
)


case "${CARCH}" in
  i686)
    _targetdirname="rainbowcrack-${pkgver}-linux32"
  ;;
  x86_64)
    _targetdirname="rainbowcrack-${pkgver}-linux64"
  ;;
  *)
    _targetdirname="rainbowcrack-${pkgver}-linuxother"
  ;;
esac


package() {
  _unpackeddir="${srcdir}/${_targetdirname}"
  cd "${_unpackeddir}"
  
  install -v -d -m755 "${pkgdir}/opt/rainbowcrack"
  install -v -d -m755 "${pkgdir}/usr/bin"
  install -v -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}"
  install -v -d -m755 "${pkgdir}/usr/share/doc/${_pkgname}/doc"
  install -v -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  
  for _binfile in rcrack rt2rtc rtc2rt rtgen rtsort; do
    install -v -m755 "${_binfile}" "${pkgdir}/opt/rainbowcrack/${_binfile}"
    ln -sv "/opt/rainbowcrack/${_binfile}" "${pkgdir}/usr/bin/${_binfile}"
  done
  
  for _regfile in alglib0.so charset.txt; do
    install -v -m644 "${_regfile}" "${pkgdir}/opt/rainbowcrack/${_regfile}"
  done
  
  install -v -m644 "readme.txt" "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
  install -v -m644 "readme.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  
  for _doc in "${_docs[@]}"; do
    install -v -m644 "${srcdir}/$(basename "${_doc}")" "${pkgdir}/usr/share/doc/${_pkgname}/doc"
  done
}
