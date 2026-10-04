# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://git.felo.gg/Felitendo/PKGBUILDS

pkgname=bt-volume-step
pkgver=1.0.0
pkgrel=1
pkgdesc="Fixed volume steps for Bluetooth audio devices on PipeWire"
arch=('any')
url="https://git.felo.gg/LoonixTools/bt-volume-step"
license=('BSD-3-Clause')
depends=('python' 'libpulse')
optdepends=('kconfig: follow the KDE Plasma volume step setting'
            'bluez-utils: device names in --show')
# Arch packages never enable units themselves (the default preset is
# "disable *"), and a user unit could not be enabled from a pacman transaction
# anyway - it runs as root, without the user's session bus. Print the command
# instead.
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('32373fd4440dcd7bd19988f78675f9cf400ec7ebe51a828bbd9468ee0c5a18dc')

check() {
  cd "${pkgname}"
  make check
}

package() {
  cd "${pkgname}"
  make install PREFIX=/usr DESTDIR="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
