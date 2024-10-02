# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="pte"
_pkgname="portable-text-encryptor"
pkgname="${_pkgname}-bin"
pkgver=14.12
pkgrel=1
pkgdesc="Single Linux or Windows binary for secure text encryption"
arch=('x86_64')
url="https://${_pkgname}.sourceforge.net"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'glibc' 'libx11' 'libxft')
makedepends=('patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::https://downloads.sourceforge.net/sourceforge/${_pkgname}/${_binname}_v${pkgver}.zip")
sha256sums_x86_64=('220a0262522b22abea3855494bd4987d6031487edc1234741cae15632d12e91f')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.zip" -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  patchelf --remove-needed "libfreetype.so.6" "${_binname}"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "readme.txt"  "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
