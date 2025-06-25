# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ft-crypt"
pkgname="${_pkgname}-bin"
pkgver=3.01
pkgrel=1
pkgdesc="Multi-cipher file/text encryption tool with robust keystream generation"
arch=('x86_64')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'glibc' 'libx11' 'libxft')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.zip::https://downloads.sourceforge.net/project/${_pkgname}/${pkgver%%.*}.xx/ftc_v${pkgver}.zip")
b2sums_x86_64=('eaedf9b05210fdce37c8afbb98636dd47c81cd6df38597cbbc55db103b8bfb9256630ae10e24e17411af41c66bb34e28b51fa5871c826963fce205366684cca7')

prepare() {
  cd "${srcdir}"
  rm -rf "${_pkgsrc}-${CARCH}" "win64"
  mv -f "linux" "${_pkgsrc}-${CARCH}"
  mv -f "readme.txt" "${_pkgsrc}-${CARCH}/README.txt"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -vDm755 "ftc"        "${pkgdir}/usr/bin/ftc"
  install -vDm755 "ftc_engine" "${pkgdir}/usr/bin/ftc_engine"
  install -vDm644 "README.txt" "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
}
