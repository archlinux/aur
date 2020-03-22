# Maintainer: Edward Pacman <edward@edward-p.xyz>

_projectname=dnsproxy
pkgname=dnsproxy-adguard
pkgver=0.24.0
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, and DNSCrypt support by AdguardTeam"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
source=("dnsproxy-adguard.service"
        "https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go" "git")
sha256sums=('e10bee304ce60088e523b0925c85a7c0640eaf4b2a686d301de565290e70560a'
            '6b12caa51e797aa5bb8da219dd4db831ca680e8811de92859250b71d0bbf282a')

build(){
    cd "${srcdir}/${_projectname}-${pkgver}"
    go build
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/dnsproxy-adguard.service" "${pkgdir}/usr/lib/systemd/system/dnsproxy-adguard.service"
}
