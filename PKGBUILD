# Author and maintainer: jbarnett (aur AT wbarnett DOT us)
pkgname=openvpn-pia
pkgver=2018.01.09
pkgrel=2
pkgdesc="OpenVPN configuration files for Private Internet Access VPN"
url="https://www.privateinternetaccess.com"
arch=('i686' 'x86_64')
license=('none')
depends=('openvpn')
install='openvpn-pia.install'
source=(${url}/openvpn/openvpn-strong.zip
        README)
sha512sums=('471e94d24d935129963f73294a237a74e53151ef806ad7dc94ad0c267cbfdbe96421e9a8a61183ea5e6307699824acdc78b86906436b196177c8f65b0dd14fd6'
            '45cf92acfcc3b6167f3a41536cd1c7bba0c65445a4ce7d9257519d2a8747cf3c0e1159531389ac2ab719e7969c6e8bf6c7a1b232025d14057e82c0bc2b4f3265')

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
