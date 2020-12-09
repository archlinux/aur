# Maintainer: Alexandr Stelnykovych <alexandr dot stelnykovych at ivpn dot net>

pkgname="ivpn-ui"
pkgver=3.2.3
pkgrel=1
pkgdesc="IVPN Graphical User Interface"
arch=('x86_64')
url="https://ivpn.net"
license=('GPL3')
depends=('ivpn')
makedepends=('npm')
install="ivpn-ui.install"

source=("ivpn-ui-src-v${pkgver}.tar.gz::https://github.com/ivpn/desktop-app-ui2/archive/v${pkgver}.tar.gz")
sha256sums=('3166518f729583f7660069277868bb863f7573a1696a184a700a4b39b5bc83b9')

build() {
  cd "$srcdir/desktop-app-ui2-${pkgver}"
  npm install
  ./References/Linux/build.sh
}

package() {
  cd "$srcdir/desktop-app-ui2-${pkgver}"

  mkdir -p "$pkgdir/opt/ivpn/ui/bin"
  cp -fr dist_electron/linux-unpacked/* "$pkgdir/opt/ivpn/ui/bin"

  install -D "References/Linux/ui/IVPN.desktop" "$pkgdir/usr/share/applications/IVPN.desktop"

  install -D  "References/Linux/ui/IVPN.desktop" "$pkgdir/opt/ivpn/ui/IVPN.desktop"
  install -D  "References/Linux/ui/ivpnicon.svg" "$pkgdir/opt/ivpn/ui/ivpnicon.svg"
}
