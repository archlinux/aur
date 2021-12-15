# Maintainer: arjan5 <aur@anymore.nl>

_pkgname=ntfy
pkgname=${_pkgname}sh-bin
pkgver=1.6.1
pkgrel=2
pkgdesc="Send push notifications to your phone or desktop using PUT/POST"
arch=("x86_64")
url="https://github.com/binwiederhier/ntfy"
license=('GPL2')
depends=()
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_x86_64.tar.gz"
        "${_pkgname}.sysusers")
backup=('etc/ntfy/config.yml')

sha256sums=('24555c0b0dc6b611c686da169a4ac0a5c9ed6b259e41912fd4c90c25966856ac'
            '0799a140256072b350b56c1b2db5fc21c94c6992277d6d1364c28ddf7058cc8f')

package() {
    cd "${srcdir}/${_pkgname}_${pkgver}_linux_x86_64/"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "config/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "config/config.yml" "${pkgdir}/etc/ntfy/config.yml"
    install -Dm0644 "../${_pkgname}.sysusers" "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
}

