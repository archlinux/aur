# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor Tavian Barnes <tavianator@tavianator.com>
# Contributor jhorcl
pkgname=mozillavpn
pkgver=2.4.1
_debian_series=hirsute1
pkgrel=1
pkgdesc="A fast, secure and easy to use VPN. Built by the makers of Firefox."
arch=('i686' 'x86_64')
url="https://vpn.mozilla.org/"
license=('GPL')
depends=('polkit'
         'qt5-charts'
         'qt5-declarative'
         'qt5-graphicaleffects'
         'qt5-imageformats'
         'qt5-networkauth'
         'qt5-quickcontrols2'
         'qt5-svg'
         'hicolor-icon-theme'
         'wireguard-tools'
         'WIREGUARD-MODULE'
         'openresolv')
makedepends=('qt5-tools')
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages
source=(
    "https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn/${pkgver}-${_debian_series}/mozillavpn_${pkgver}.orig.tar.gz"
    "https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn/${pkgver}-${_debian_series}/mozillavpn_${pkgver}-${_debian_series}.debian.tar.xz")
sha256sums=('41072b7554cd0aaf5f66c90c088bf6b88e241fc02723c251a2f61aedcd99de4e'
            'deeaed77c2835786e0d36c572440549c40d1f3c909f4ca6026163d20c11634fa')

build() {
    qmake PREFIX=/usr CONFIG+=production
    make
}

package() {
    make INSTALL_ROOT="$pkgdir" install
    install -dm 755 "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "linux/mozillavpn.service" "$pkgdir/usr/lib/systemd/system"
}
