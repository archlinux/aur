# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>

pkgname="ivpn-ui"
pkgver=3.3.7
pkgrel=1
pkgdesc="IVPN Graphical User Interface"
arch=('x86_64')
url="https://ivpn.net"
license=('GPL3')
depends=('ivpn')
makedepends=('npm')
install="ivpn-ui.install"

source=("ivpn-ui-src-v${pkgver}.tar.gz::https://github.com/ivpn/desktop-app-ui2/archive/v${pkgver}.tar.gz")
sha256sums=('ee810356922bd04b4691fb2d56ee7e64d6ef31e2b0fc14fd28e4f4857cbf0a6a')

build() {
  cd "$srcdir/desktop-app-ui2-${pkgver}"
  npm install
  ./References/Linux/compile-ui.sh
}

package() {
  cd "$srcdir/desktop-app-ui2-${pkgver}"

  mkdir -p "$pkgdir/opt/ivpn/ui/bin"
  cp -fr dist_electron/linux-unpacked/* "$pkgdir/opt/ivpn/ui/bin"

  install -D "References/Linux/ui/IVPN.desktop" "$pkgdir/usr/share/applications/IVPN.desktop"

  install -D  "References/Linux/ui/IVPN.desktop" "$pkgdir/opt/ivpn/ui/IVPN.desktop"
  install -D  "References/Linux/ui/ivpnicon.svg" "$pkgdir/opt/ivpn/ui/ivpnicon.svg"
}
