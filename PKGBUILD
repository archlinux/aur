# Maintainer: arjan5 <aur@anymore.nl>
# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>

_pkgname=ntfy
pkgname=${_pkgname}sh-bin
pkgver=2.38.1
pkgrel=1
pkgdesc="Send push notifications to your phone or desktop (upstream bin)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/binwiederhier/ntfy"
license=(
  'GPL-2.0-only'
  'Apache-2.0'
)
depends=()
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=(
  'etc/ntfy/client.yml'
  'etc/ntfy/server.yml'
)
options=(!debug !strip) # not needed as this is binary
source=("${_pkgname}.sysusers")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums=('0799a140256072b350b56c1b2db5fc21c94c6992277d6d1364c28ddf7058cc8f')
sha256sums_x86_64=('9727d45e5da86c3f338f0f329044485bddde76f3fbbbc3f9e695c14776f09c32')
sha256sums_aarch64=('1b9158ece3589792bf8605171df21d6d99d1608bcbddf59bb5fb7878f18e88c3')
sha256sums_armv7h=('33784a7f75fccc29af2d73807489cdfeecd86e06fc54ad98080e70ebaf4612ba')

package() {
  case "${CARCH}" in
    "x86_64")
      cd "${srcdir}/${_pkgname}_${pkgver}_linux_amd64/"
      ;;
    "aarch64")
      cd "${srcdir}/${_pkgname}_${pkgver}_linux_arm64/"
      ;;
    "armv7h")
      cd "${srcdir}/${_pkgname}_${pkgver}_linux_armv7/"
      ;;
  esac
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "client/${_pkgname}-client.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-client.service"
  install -Dm644 "client/client.yml" "${pkgdir}/etc/ntfy/client.yml"
  install -Dm644 "client/user/${_pkgname}-client.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}-client.service"
  install -Dm644 "server/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm644 "server/server.yml" "${pkgdir}/etc/ntfy/server.yml"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "../${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}
