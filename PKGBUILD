# Maintainer: arjan5 <aur@anymore.nl>
# Maintainer: txtsd
# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>

_pkgname=ntfy
pkgname=${_pkgname}sh-bin
pkgver=2.25.0
pkgrel=1
pkgdesc="Send push notifications to your phone or desktop (upstream bin)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/binwiederhier/ntfy"
license=('GPL-2.0')
depends=()
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=(
  'etc/ntfy/client.yml'
  'etc/ntfy/server.yml'
)
source=("${_pkgname}.sysusers")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")

sha256sums=('0799a140256072b350b56c1b2db5fc21c94c6992277d6d1364c28ddf7058cc8f')
sha256sums_x86_64=('628bc8d3ad73778484ae1c6116e7745ef5fa414619567e6b4c2581927c355b1e')
sha256sums_aarch64=('ed8d4ecf77b7e9d338eac8d412919a95cb0fc3757acd852903fd90d678b84afc')
sha256sums_armv7h=('6362e4149f6e2d5b1782195bce27a59596e3d0fd37e04e7afd22824e6c33754b')

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

