# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Premake"
_basename="${_Name,,}"
pkgver=4.4beta5
_pkgname="${_basename}${pkgver%%.*}"
pkgname="${_pkgname}-bin"
pkgrel=1
pkgdesc="A simple build configuration and project generation tool"
arch=('i686' 'x86_64')
url="https://premake.github.io"
license=('BSD-3-Clause')
depends_i686=('glibc')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_basename}-${pkgver//beta/-beta}"
source=("${_pkgsrc}.zip::https://downloads.sourceforge.net/project/${_basename}/${_Name}/${pkgver%%beta*}/${_pkgsrc}-src.zip"
        "${_pkgname}_manpage.patch")
source_i686=("${_pkgsrc}-i686.tar.gz::https://downloads.sourceforge.net/project/${_basename}/${_Name}/${pkgver%%beta*}/${_pkgsrc}-linux.tar.gz")
source_x86_64=("${source_i686[@]}")
sha256sums=('0fa1ed02c5229d931e87995123cdb11d44fcc8bd99bba8e8bb1bbc0aaa798161'
            'f3c8b20fa231a496f41781ad449f75ec36555d216166cd77c2b709acf62693f6')
sha256sums_i686=('34915548110e930012dbf3368d995f34509a1c46b3d8893def19613aae063693')
sha256sums_x86_64=('34915548110e930012dbf3368d995f34509a1c46b3d8893def19613aae063693')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np0 -i "${srcdir}/${_pkgname}_manpage.patch" || true
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "CHANGES.txt"   "${pkgdir}/usr/share/doc/${_pkgname}/CHANGES.txt"
  install -vDm644 "README.txt"    "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
  install -vDm644 "LICENSE.txt"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
