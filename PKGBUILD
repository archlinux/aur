# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=mozillavpn
pkgver=2.3.0
pkgrel=1
epoch=
pkgdesc="A fast, secure and easy to use VPN. Built by the makers of Firefox."
arch=('i686' 'x86_64')
url="https://vpn.mozilla.org/"
license=('GPL')
groups=()
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
checkdepends=()
optdepends=()
provides=()
conflicts=('mozilla-vpn-client')
replaces=('mozilla-vpn-client')
backup=()
options=()
install=
changelog=
source=("https://launchpad.net/~mozillacorp/+archive/ubuntu/mozillavpn/+sourcefiles/$pkgname/$pkgver-groovy1/${pkgname}_${pkgver}.orig.tar.gz" "$pkgname.service")
noextract=()
sha256sums=('2957936408df32efc2c1a7ce896214e3683194b0f8e2fec5ef4ac7c33e142e4d'
            'cedcbee738273d11d597a3054a55da98fa45daa0c58cd70936be54f0eae956a4')
validpgpkeys=()

build() {
    qmake PREFIX=/usr CONFIG+=production
	make
}

package() {
	make INSTALL_ROOT="$pkgdir" install
	
	install -dm 755 "$pkgdir/usr/lib/systemd/system"
    install -Dm 644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system"
}
