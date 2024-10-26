# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="quad"
pkgname="${_pkgname}-bin"
pkgver=1.12
pkgrel=1
pkgdesc="High-performance file compressor that utilizes an advanced LZ-based compression algorithm"
arch=('x86_64' 'i686')
url="https://${_pkgname}.sourceforge.net"
license=('LGPL-2.1-or-later')
depends=('glibc')
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-"{x86_64,i686}".tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::https://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgsrc}-linux_amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::https://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgsrc}-linux_i486.tar.gz")
sha256sums_x86_64=('01f94e39f85284e2e1f955f85287c74e5396088f99d50006794ea520c936d562')
sha256sums_i686=('b6f5f8db02a47cf7741b8bc95ce0fd9bb5f36e3df083dc4006cd8c05d2323ac5')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.tar.gz" -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README"      "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
  install -Dm644 "COPYING"     "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING.txt"
}
