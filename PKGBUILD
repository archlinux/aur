# Maintainer: agony <27015 at riseup dot net>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sngrep"
pkgname="${_pkgname}-bin"
pkgver=1.10.0
pkgrel=1
pkgdesc="A tool for displaying SIP call message flows from a terminal (prebuilt)"
arch=('x86_64')
url="https://github.com/irontec/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('bash' 'coreutils' 'ncurses')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}rc")
install="${pkgname}.install"
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README"
        "${_pkgsrc}.man.8::${url}/raw/refs/tags/v${pkgver}/doc/${_pkgname}.8"
        "${_pkgsrc}-${_pkgname}rc::${url}/raw/refs/tags/v${pkgver}/config/${_pkgname}rc"
        "${_pkgname}.sh")
source_x86_64=("${_pkgsrc}-x86_64::https://packages.irontec.com/binaries/${_pkgname}-static-amd64-linux-gnu-${pkgver}")
sha256sums=('6aab9564131a94f4d0cd03f93376010cb7ab66d0402d1c6aa2d5f82ed594d3ab'
            'ea78544eb07419eb89e820a007cfc4c5d3dd5dd5cc7afd45098b8208cfed785d'
            'dc7609a7acac3caeae44adb87f4b51d113186939507a19a7d3cb3d06334362d9'
            'd1612085ffe73d5d02ed06e8835031ebf403b648eea78fe76a08a88741e1004b')
sha256sums_x86_64=('efc63f96c05d19ad462e75746c382b6bed5b32a6cba1fe68b66157508bf83a57')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -vDm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}.man.8" "${pkgdir}/usr/share/man/man8/${_pkgname}.8"
  install -vDm644 "${_pkgsrc}-${_pkgname}rc" "${pkgdir}/etc/${_pkgname}rc"
}
