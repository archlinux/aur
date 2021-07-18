# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor Tavian Barnes <tavianator@tavianator.com>
pkgname=mozillavpn
pkgver=2.2.0
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
         'WIREGUARD-MODULE')
makedepends=('qt5-tools')
# https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+packages
source=(
    "mozillavpn_2.2.0.orig.tar.gz::https://drive.google.com/uc?export=download&id=1YCR9rl7mGJMDkzOc__Hm1MM1TaiWA_F2"
    "https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/mozillavpn/2.3.3-hirsute1/mozillavpn_2.3.3-hirsute1.debian.tar.xz")
sha256sums=('58ff1148904c760c92b58b4503093def3e686a30d2b228fa9f9503b3f0420b6d'
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
