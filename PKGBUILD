# Maintainer: arjan5 <aur@anymore.nl>

_pkgname=ntfy
pkgname=${_pkgname}sh-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Send push notifications to your phone or desktop using PUT/POST"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/binwiederhier/ntfy"
license=('GPL2')
depends=()
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${arch}.tar.gz"
        "${_pkgname}.sysusers")
backup=('etc/ntfy/server.yml' 'etc/ntfy/client.yml')

sha256sums=('955b3c1cc082d2fbd93cbe02d75d22a4698e28ad83d0d3fd6a4cd183b768b4c3'
            '0799a140256072b350b56c1b2db5fc21c94c6992277d6d1364c28ddf7058cc8f')

package() {
    cd "${srcdir}/${_pkgname}_${pkgver}_linux_x86_64/"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "client/${_pkgname}-client.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-client.service"
    install -Dm644 "client/client.yml" "${pkgdir}/etc/ntfy/client.yml"
    install -Dm644 "server/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "server/server.yml" "${pkgdir}/etc/ntfy/server.yml"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "../${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
}

