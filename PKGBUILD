pkgname=openvpn-pia
pkgver=2017.03.28.12.03.55
pkgrel=1
pkgdesc="OpenVPN configuration files for Private Internet Access VPN"
url="https://www.privateinternetaccess.com"
arch=('i686' 'x86_64')
license=('none')
depends=('openvpn')
install='openvpn-pia.install'
source=(http://www.privateinternetaccess.com/openvpn/openvpn-strong.zip
        README)
sha512sums=('471e94d24d935129963f73294a237a74e53151ef806ad7dc94ad0c267cbfdbe96421e9a8a61183ea5e6307699824acdc78b86906436b196177c8f65b0dd14fd6'
            '5a2d03805decefbda5ed54d00ae94d0fc3c65831b4e6135fe99650d092a96aff7407aa8c4bff69fcfac6edb5bc6526112867d5d334f4511492c2d2ff8f29c1f0')

pkgver() {
    date +%Y.%m.%d.%H.%M.%S
}

prepare() {
    cd $srcdir
    rename .ovpn .conf *.ovpn
    rename ' ' '-' *.conf
    rename ' ' '-' *.conf
    rename ' ' '-' *.conf
    sed -i 's$auth-user-pass$auth-user-pass /etc/openvpn-pia.conf$g' *.conf
    sed -i 's$ca.rsa.4096.crt$/etc/openvpn/client/ca.rsa.4096.crt$g' *.conf
    sed -i 's$crl.rsa.4096.pem$/etc/openvpn/client/crl.rsa.4096.pem$g' *.conf
}

package() {
    cd $srcdir
    mkdir -p -m750 $pkgdir/etc/openvpn/client/
    mkdir -p -m755 $pkgdir/usr/share/doc/openvpn-pia
    install -m644 README -t $pkgdir/usr/share/doc/openvpn-pia
    install -m644 *.conf -t $pkgdir/etc/openvpn/client/
    install -m644 *.pem  -t $pkgdir/etc/openvpn/client/
    install -m644 *.crt  -t $pkgdir/etc/openvpn/client/
}
