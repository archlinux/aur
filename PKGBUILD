pkgname=openaws-vpn-client-bin
_pkgname=${pkgname%%-bin}
_source_url="https://gitlab.com/api/v4/projects/32275975/packages/generic"
pkgver=0.1.8
pkgrel=2
pkgdesc="Unofficial Open-Source AWS VPN Client for Linux based off of samm-git study"
arch=('x86_64')
url="https://github.com/JonathanxD/openaws-vpn-client"
license=('MIT')
source=("${_pkgname}-${pkgver}.tar.gz::${_source_url}/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz" "local://openaws-vpn-client-script")
sha512sums=('259089a884d440ad3510240db35918d6d3907a30b8efb32bc280bd60497ceb707bdda21e47deb10af8cd16dc06e35f2553e5e23cff6d685943ce0cbe38c07bb8' '63c1d8100c9852d401072ffeeeeab04513d01bb186150dcd9910022b946ca27b126145e9b2539b09ce82051cab824fd93c5d964d4bbdba99bccc3c5f015782ec')
noextract=("openaws-vpn-client-script")
depends=('gtk3>=3.0.0' 'cairo>=1.17.0' 'pango>=1.50.0' 'atk>=2.38.0' 'openssl>=3.0.0')

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
