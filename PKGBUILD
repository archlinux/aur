# Maintainer: dcordonu

pkgname=connect-tunnel
pkgver=12.40.00513
pkgrel=1
pkgdesc="SonicWALL Connect Tunnel VPN Client"
arch=('x86_64')
url="https://www.sonicwall.com/products/remote-access/vpn-clients/"
depends=('java-runtime')
makedepends=('tar')
license=('custom')
source=(
    "ConnectTunnel_Linux64-${pkgver}.tar::https://software.sonicwall.com/CT-NX-VPN%20Clients/CT-12.4.0/ConnectTunnel_Linux64-${pkgver}.tar"
    "https://www.sonicwall.com/legal/general-product-agreement"
)
md5sums=('f36008a0ecfc2c7f7962c264020a1710' 'SKIP')
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

install=${pkgname}.install

prepare() {
    tar -xf ConnectTunnel-Linux64-${pkgver}.tar.bz2
}

package() {
    install -Dm 644 general-product-agreement ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm 644 version ${pkgdir}/usr/local/Aventail/version

    cd usr/local/Aventail
    
    install -Dm 644 man/ct.5 ${pkgdir}/usr/local/Aventail/man/ct.5
    install -Dm 755 startct.sh ${pkgdir}/usr/local/Aventail/startct.sh
    install -Dm 755 startctui.sh ${pkgdir}/usr/local/Aventail/startctui.sh
    install -Dm 644 nui/nui.jar ${pkgdir}/usr/local/Aventail/nui/nui.jar
    install -Dm 4755 AvConnect ${pkgdir}/usr/local/Aventail/AvConnect
    install -Dm 644 install-sem.sh ${pkgdir}/usr/local/Aventail/install-sem.sh
    install -Dm 644 run-sem.sh ${pkgdir}/usr/local/Aventail/run-sem.sh
    install -Dm 644 cttel.pl ${pkgdir}/usr/local/Aventail/cttel.pl

    gendesk -n -f --pkgname ${pkgname} --pkgdesc "${pkgdesc}" --name "Connect Tunnel" --exec startctui

    install -Dm644 logo.png ${pkgdir}/usr/share/pixmaps/connect-tunnel.png
    install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
