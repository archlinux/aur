# Maintainer: Edward Pacman <edward@edward-p.xyz>

_projectname=dnsproxy
pkgname=dnsproxy-adguard
pkgver=0.20.1
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, and DNSCrypt support by AdguardTeam"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
source=("dnsproxy-adguard.service"
        "https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go" "git")
sha256sums=('e10bee304ce60088e523b0925c85a7c0640eaf4b2a686d301de565290e70560a'
            '4a5e9da1d7441e8a8f4e10a4816f5c1efa49e43ed9b2436bbeeeabb70ceee0be')

build(){
    cd "${srcdir}/${_projectname}-${pkgver}"
    go build
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/dnsproxy-adguard.service" "${pkgdir}/usr/lib/systemd/system/dnsproxy-adguard.service"
}
