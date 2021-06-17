# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor Tavian Barnes <tavianator@tavianator.com>
pkgname=mozillavpn
pkgver=2.3.1
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
         'WIREGUARD-MODULE')
makedepends=('qt5-tools')
source=(
    "https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/$pkgname/$pkgver-groovy1/${pkgname}_${pkgver}.orig.tar.gz"
    "mozillavpn.service::https://raw.githubusercontent.com/mozilla-mobile/mozilla-vpn-client/main/linux/debian/mozillavpn.service")
sha256sums=('4278edc2b7fe4c19a54ea2a08272d9bb6b1e910083feb78da1d41cb76128c92f'
            'd51c81b06f38bef502113a59930302c27652b76215a7933e3632ea16923200e3')

build() {
    qmake PREFIX=/usr CONFIG+=production
    make
}

package() {
    make INSTALL_ROOT="$pkgdir" install

    install -dm 755 "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system"
}
