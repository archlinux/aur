# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ft-crypt"
pkgname="${_pkgname}-bin"
pkgver=2.02
pkgrel=2
pkgdesc="Multi-cipher file/text encryption tool with robust keystream generation"
arch=('x86_64')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'glibc' 'libx11' 'libxft')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.zip::https://downloads.sourceforge.net/project/${_pkgname}/${pkgver%%.*}.xx/ftc_v${pkgver}.zip")
b2sums_x86_64=('729fa8f237a1db7c78be918cbce4e4c3861aa98427f68fbdea54d6c5a1555831f1f7e79517ef775222d96e51f27221976cfe4b38c04dde4fc65811c34326ee64')

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
