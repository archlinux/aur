# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="TermGL"
_name="${_Name,,}"
pkgname="lib${_name}"
pkgver=1.5.0
pkgrel=1
pkgdesc="2D & 3D graphics engine in the terminal"
arch=('x86_64')
url="https://github.com/wojciech-graj/${_Name}"
license=('MIT')
depends=('glibc')
provides=("${pkgname}.so")
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5f27aac5b275fad396162fe67e54be6b0dea6a8ad9224e434f3fbd7e8d8b10e')

# prepare() {
#   cd "${srcdir}/${_pkgsrc}"
#   sed -i 's|/usr/local|'"${pkgdir}/usr|g" Makefile
# }

build() {
  cd "${srcdir}/${_pkgsrc}"
  make shared
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # mkdir -p "${pkgdir}/usr/lib" "${pkgdir}/usr/include"
  # make DESTDIR="${pkgdir}" install

  install -vDm644 "${pkgname}.so" "${pkgdir}/usr/lib/${pkgname}.so.${pkgver}"
  install -vDm644 "${_name}.h"    "${pkgdir}/usr/include/${_name}.h"

  cd "${pkgdir}/usr/lib"
  ln -s "${pkgname}.so.${pkgver}" "${pkgname}.so.${pkgver%%.*}"
  ln -s "${pkgname}.so.${pkgver}" "${pkgname}.so"
}
