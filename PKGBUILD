# Maintainer: czyt <czytcn@gmail.com>

pkgname=stela-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="General purpose Apple Silicon layer for x86-64 PCs: boots macOS on a PC from a USB stick"
arch=('x86_64')
url="https://github.com/tylertms/Stela"
license=('GPL-2.0-or-later')
depends=('glibc' 'libgcc')
conflicts=('stela')
options=('!strip' '!debug')

_tarball="stela-v${pkgver}-linux-x86_64.tar.gz"
source=("${_tarball}::${url}/releases/download/v${pkgver}/${_tarball}")
sha256sums=('d0c374d388de8d4859b7ea173f0be8599edcf943ffadd47b7d2369abfffcfa99')

package() {
  local _src="stela-v${pkgver}-linux-x86_64"
  bsdtar -xzf "${srcdir}/${_tarball}" -C "${srcdir}"

  install -Dm755 "${srcdir}/${_src}/stela" "${pkgdir}/usr/bin/stela"

  install -Dm644 "${srcdir}/${_src}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_src}/NOTICE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  cp -r "${srcdir}/${_src}/LICENSES" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES"
}
