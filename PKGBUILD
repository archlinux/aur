# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-bin
pkgver=1.6.4
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk-openjdk')
validpgpkeys=('CB36D7D2EBB2E35D9B75500BCD5DC1C529CDFD3B')
source_x86_64=("https://github.com/bisq-network/bisq/releases/download/v${pkgver}/Bisq-64bit-${pkgver}.deb"{,.asc})
sha512sums_x86_64=('81f6405a70eb0eecb56575bfbf0567d353d0835f707830f141480749fb917c2ebc0deb2438a79ca94ad5ef6aa87f3c1d61343b9e1a3d53fb0d29bd131631e9e1'
                   '52331e465a26eeb92c5090aa75553a9eeb58c1007891eecd2155fa6d6af6588cf8d74cc09d958cdcfe11ad2ce8c331dfeb38f677a271d7c2824fb16973f22ac6')
_binname=Bisq
conflicts=("bisq" "bisq-git")
provides=("bisq-bin")

prepare() {
  tar -Jxvf data.tar.xz
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps}

  # Install all .deb files into /opt.
  cp -r "$srcdir/opt" "$pkgdir"

  # Symlink some files to complete install.
  ln -s "/opt/$_binname/$_binname" "$pkgdir/usr/bin/bisq"
  ln -s "/opt/$_binname/${_binname}.desktop" "${pkgdir}/usr/share/applications/bisq.desktop"
  ln -s "/opt/$_binname/${_binname}.png" "${pkgdir}/usr/share/pixmaps/bisq.png"
}
