# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="datatype99"
pkgver=1.6.5
pkgrel=2
pkgdesc="Algebraic data types for C99"
arch=(
  'any'
)
url="https://github.com/hirrolot/${pkgname}"
license=(
  'MIT'
)
depends=(
  'metalang99'
)
checkdepends=(
  'cmake>=3.16'
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
sha256sums=('f38c077afdb91b7d754321be5d3c4a43ed5420c1ad51514d1de20023960f9a8e')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -E -e '/FetchContent_Declare\(/{:a;N;/\)/!ba;d;}' \
         -e '/FetchContent/d' \
         -e '/INTERFACE metalang99/d' \
         -i 'CMakeLists.txt'
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  ./scripts/test.sh
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${pkgname}.h" -t "${pkgdir}/usr/include"
  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
