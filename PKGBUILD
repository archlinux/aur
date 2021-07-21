# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor Tavian Barnes <tavianator@tavianator.com>
# Contributor jhorcl
pkgname=mozillavpn
pkgver=2.3.3
_debian_series=hirsute1
pkgrel=2
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
sha256sums=('4bcb5239d77fed42a7370649cb0b32a23cad723830494e54471fa70c2469097a'
            '7191e7dabea9251575030e175e879664f06a4e079e9306285191f2c0f008b30a')

build() {
    qmake PREFIX=/usr CONFIG+=production
    make
}

package() {
    make INSTALL_ROOT="$pkgdir" install
    install -dm 755 "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "debian/mozillavpn.service" "$pkgdir/usr/lib/systemd/system"
}
