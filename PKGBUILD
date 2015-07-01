pkgname=pia-launch
pkgver=20141003
pkgrel=1
pkgdesc="A simple wrapper for OpenVPN for use with Private Internet Access"
arch=('any')
url="https://github.com/dh4/pia-launch"
license=('BSD')
depends=('openvpn')
source=('https://www.privateinternetaccess.com/openvpn/openvpn-ip.zip')
md5sums=('8c4b2fb12250781eba4e706aad117960')

_gitroot='https://github.com/dh4/pia-launch.git'
_gitname='pia-launch'

build() {
    cd "$srcdir"
    git clone "$_gitroot"
}

package() {
    cd "$srcdir"

    for file in *; do
        if [[ $file != "openvpn-ip.zip" && $file != "$_gitname" ]]; then
            install -Dm644 "$file"              "$pkgdir/etc/openvpn/privateinternetaccess/$file"
        fi
    done

    cd "$_gitname"
    install -Dm755 "pia-launch.sh"              "$pkgdir/usr/bin/pia-launch"
    install -Dm644 "LICENSE"                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "etc/openvpn/privateinternetaccess/"
    install -Dm644 "resolv.conf"                "$pkgdir/etc/openvpn/privateinternetaccess/resolv.conf"
    install -Dm644 "auth/auth.ovpn"             "$pkgdir/etc/openvpn/privateinternetaccess/auth/auth.ovpn"
    install -Dm640 "auth/credentials.txt"       "$pkgdir/etc/openvpn/privateinternetaccess/auth/credentials.txt"
}
