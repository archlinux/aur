# Maintainer: Kim Taehwan <ktcar214@ktcar214.com>
# Contributor: Edward Pacman <edward@edward-p.xyz>

_projectname=dnsproxy
pkgname=dnsproxy-adguard
pkgver=0.39.8
pkgrel=1
pkgdesc="Simple DNS proxy with DoH, DoT, and DNSCrypt support by AdguardTeam"
arch=('x86_64')
url="https://github.com/AdguardTeam/dnsproxy"
license=('Apache')
source=("dnsproxy-adguard.service"
        "dnsproxy-adguard"
       "https://github.com/AdguardTeam/dnsproxy/archive/v${pkgver}.tar.gz")
makedepends=("go" "git")
backup=(etc/conf.d/dnsproxy-adguard)
sha256sums=('7a6c7a49bae6865e23db6ea0bb438a5588769cae742936bfd4c6d7b0a0c6b424'
            'de2afa0883f2829a1f7487899ddc9e711913686aea1ce186a60aad022604df4b'
            '99a6b0a1471507d6946ad9116218b6ea4054224f5d9d9faf901e77a500ba074e')

build(){
    cd "${srcdir}/${_projectname}-${pkgver}"
    go build
}

package() {
    cd "${srcdir}/${_projectname}-${pkgver}"
    install -Dm755 dnsproxy "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/dnsproxy-adguard.service" "${pkgdir}/usr/lib/systemd/system/dnsproxy-adguard.service"
    install -Dm644 "${srcdir}/dnsproxy-adguard" "${pkgdir}/etc/conf.d/dnsproxy-adguard" 
}
