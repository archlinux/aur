pkgname=pia-nm
pkgver=24
pkgrel=1
pkgdesc="Network manager configuration files for Private Internet Access VPN"
url="https://www.privateinternetaccess.com"
arch=('i686' 'x86_64')
license=('none')
depends=('networkmanager-openvpn')
makedepends=('python2')
pia_cert=ca.rsa.4096.crt
source=(
https://www.privateinternetaccess.com/openvpn/$pia_cert
servers::https://www.privateinternetaccess.com/vpninfo/servers?version=$pkgver
process_servers)
sha512sums=('6be9bc842259b8b5f68cc8a68608de282bd621222b636f8195dfe6cee4c9c0b1559ea45e38a46719cff43beda792b684f83cec82dccc487a9acbd988847f5ea5'
            '71a3f186f5bbc3ac2634403a3bc8c9512cd764bdbafdaf24ba122596c2359579b5b88cc7d2ae8095e4cec5dd85788668afa4886833430c39c40161501b793544'
            '97dd6e36346aab99a2764553ec455db8a7a5e7b2ba1c331b07ea075a4533f7eb8fc1738fa72ff3c4483c86e5f2144304477e1d7b38fe3986d3942dfc03b33195')

prepare() {
    cd $srcdir
    ./process_servers
}

package() {
    cd $srcdir
    mkdir -p -m755 $pkgdir/etc/openvpn/
    mkdir -p -m700 $pkgdir/etc/NetworkManager/system-connections
    install -m644 $pia_cert $pkgdir/etc/openvpn/pia-$pia_cert
    install -m600 PIA* $pkgdir/etc/NetworkManager/system-connections/
}
