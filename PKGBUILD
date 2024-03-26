# Maintainer: arjan5 <aur@anymore.nl>

_pkgname=ntfy
pkgname=${_pkgname}sh-bin
pkgver=2.10.0
pkgrel=1
pkgdesc="Send push notifications to your phone or desktop using PUT/POST"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/binwiederhier/ntfy"
license=('GPL2')
depends=()
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=('etc/ntfy/server.yml' 'etc/ntfy/client.yml')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz"
               "${_pkgname}.sysusers")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz"
               "${_pkgname}.sysusers")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz"
               "${_pkgname}.sysusers")

sha256sums_x86_64=('e1457da40e879b6945036ba4bd5193cd78ab8f59d23588fbc1382bdb19f2d8e1'
                   '0799a140256072b350b56c1b2db5fc21c94c6992277d6d1364c28ddf7058cc8f')
sha256sums_aarch64=('44628c3df627c60ff607ee5881b5fa8d1ad3013b487d9f9004270c38ea7835fc'
                   '0799a140256072b350b56c1b2db5fc21c94c6992277d6d1364c28ddf7058cc8f')
sha256sums_armv7h=('00fa98e9b45ffb3383f9466e5b60b732092a7f0bcdfc420dad615b36732d2b1a'
                   '0799a140256072b350b56c1b2db5fc21c94c6992277d6d1364c28ddf7058cc8f')

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
    install -Dm644 "server/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "server/server.yml" "${pkgdir}/etc/ntfy/server.yml"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "../${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}

