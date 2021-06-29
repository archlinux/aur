# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>

pkgname="ivpn-ui"
pkgver=3.3.20
pkgrel=1
pkgdesc="IVPN Graphical User Interface"
arch=('x86_64')
url="https://ivpn.net"
license=('GPL3')
depends=('ivpn')
makedepends=('npm')
install="ivpn-ui.install"

source=("ivpn-ui-src-v${pkgver}.tar.gz::https://github.com/ivpn/desktop-app/archive/v${pkgver}.tar.gz")
sha256sums=('36df9e3d048db8d31194e91811e867042a10058096cf04ae11f6befed10c2f04')

build() {
  cd "$srcdir/desktop-app-${pkgver}/ui"
  npm install
  ./References/Linux/compile-ui.sh
}

package() {
  cd "$srcdir/desktop-app-${pkgver}/ui"

  mkdir -p "$pkgdir/opt/ivpn/ui/bin"
  cp -fr dist_electron/linux-unpacked/* "$pkgdir/opt/ivpn/ui/bin"

  install -D "References/Linux/ui/IVPN.desktop" "$pkgdir/usr/share/applications/IVPN.desktop"

  install -D  "References/Linux/ui/IVPN.desktop" "$pkgdir/opt/ivpn/ui/IVPN.desktop"
  install -D  "References/Linux/ui/ivpnicon.svg" "$pkgdir/opt/ivpn/ui/ivpnicon.svg"
}
