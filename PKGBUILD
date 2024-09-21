# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ft-crypt"
pkgname="${_pkgname}-bin"
pkgver=2.02
pkgrel=1
pkgdesc="File and Text encryption support many algorithms"
arch=('x86_64')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-3.0-or-later')
makedepends=('patchelf')
depends=('fontconfig' 'glibc' 'libx11' 'libxft')
provides=("${_pkgname}" 'ftc' 'ftc_engine')
conflicts=("${_pkgname}" 'ftc' 'ftc_engine')
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::https://downloads.sourceforge.net/sourceforge/${_pkgname}/ftc_v${pkgver}.zip")
b2sums_x86_64=('729fa8f237a1db7c78be918cbce4e4c3861aa98427f68fbdea54d6c5a1555831f1f7e79517ef775222d96e51f27221976cfe4b38c04dde4fc65811c34326ee64')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.zip" -C "${srcdir}/${_pkgsrc}-${CARCH}"

  cd "${_pkgsrc}-${CARCH}/linux"
  patchelf --remove-needed "libfreetype.so.6" "ftc"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -Dm644 "readme.txt" "${pkgdir}/usr/share/doc/${_pkgname}/README"

  cd "linux"
  install -Dm755 "ftc"        "${pkgdir}/usr/bin/ftc"
  install -Dm755 "ftc_engine" "${pkgdir}/usr/bin/ftc_engine"
}
