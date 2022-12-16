pkgname=openaws-vpn-client-bin
_pkgname=${pkgname%%-bin}
_source_url="https://gitlab.com/api/v4/projects/32275975/packages/generic"
pkgver=0.1.6
pkgrel=1
pkgdesc="Unofficial Open-Source AWS VPN Client for Linux based off of samm-git study"
arch=('x86_64')
url="https://github.com/JonathanxD/openaws-vpn-client"
license=('MIT')
source=("${_pkgname}-${pkgver}.tar.gz::${_source_url}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz" "local://openaws-vpn-client-script")
sha512sums=('5901659c6519716102f546b58e604c5e0003c249c38be0fcb1370e4c302a0f6d7f6a17805f652fd3e266132e1fcdd363a5f904dbbfa7a2142259a44cf6507b0b' '63c1d8100c9852d401072ffeeeeab04513d01bb186150dcd9910022b946ca27b126145e9b2539b09ce82051cab824fd93c5d964d4bbdba99bccc3c5f015782ec')
noextract=("openaws-vpn-client-script")

package() {
    cd "$srcdir"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Install openaws-vpn-client UI
    # NOTE: This is not the main binary, the main binary shell script is installed separately
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/bin/${_pkgname}"
    
    # Install openaws-vpn-client shell script
    install -Dm755 "openaws-vpn-client-script" "${pkgdir}/usr/bin/openaws-vpn-client"
    
    #
    install -Dm755 "share/openvpn/bin/openvpn" "${pkgdir}/usr/share/${_pkgname}/share/openvpn/bin/openvpn"
    install -Dm644 "share/openvpn/COPYING" "${pkgdir}/usr/share/${_pkgname}/share/openvpn/COPYING"
    install -Dm644 "share/openvpn/COPYRIGHT.GPL" "${pkgdir}/usr/share/${_pkgname}/share/openvpn/COPYRIGHT.GPL"
    install -Dm644 "share/openvpn/PATCH-LICENSE" "${pkgdir}/usr/share/${_pkgname}/share/openvpn/PATCH-LICENSE"
    install -Dm644 "share/pwd.txt" "${pkgdir}/usr/share/${_pkgname}/share/pwd.txt"
}
