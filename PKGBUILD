# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="interface99"
pkgver=1.0.2
pkgrel=2
pkgdesc="Full-featured interfaces for C99"
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
sha256sums=('8bd007c48cf05436ced60884e8e3a05ede46105f3efae9bf29e0f4d30f938f9e')

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
