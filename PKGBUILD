# Maintainer: czyt <czytcn@gmail.com>

pkgname=stela-bin
pkgver=0.3.1
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
sha256sums=('938e72742a1208ed3c67257b9dd8b236bfd42ac468dd7de05fdd43e4ef69f348')

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
