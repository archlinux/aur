# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-bin
pkgver=1.5.9
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk11-openjdk' 'gtk2' 'libnet')
validpgpkeys=('CB36D7D2EBB2E35D9B75500BCD5DC1C529CDFD3B')
source_x86_64=("https://github.com/bisq-network/bisq/releases/download/v${pkgver}/Bisq-64bit-${pkgver}.deb"{,.asc})
sha512sums_x86_64=('efbe90315a9c317fcce39211611ea55f08c5b67fd15904f99358ef43bf7c7de1b9763ac7f4acb48202145c9490cb8a68e86ab257fc51fa8617b157b9b6a53ad9'
                   'af99496391f9d4c534037d82abc3fb5a2ab872a0c5b22bc91dc1bdd2c23585ce71ba0f68d27ebfd29709bdec89c685eb85aa36e886e783440d6a9ccd2db0ed60')
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
