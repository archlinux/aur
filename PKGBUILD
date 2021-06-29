# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk-openjdk')
validpgpkeys=('CB36D7D2EBB2E35D9B75500BCD5DC1C529CDFD3B')
source_x86_64=("https://github.com/bisq-network/bisq/releases/download/v${pkgver}/Bisq-64bit-${pkgver}.deb"{,.asc})
sha512sums_x86_64=('9308ebea387bcd23b75656271344f62d7e2fc35d99bb1898cf10fcb1a32c926c7807b81029f1d8e871fae9c7400f8004db8090fbe72f5c61cdf20d71eb473e77'
                   '9170c4e5641e3043005b16aac3f98c1e55aff57d11c4ad0f9e2aff5c43e32f8967330dfb18c016a63c486c1b5008e7b524585f73e80fe061e77d78feef9c294f')
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
  ln -s "/opt/bisq/bin/$_binname" "$pkgdir/usr/bin/bisq"
  ln -s "/opt/bisq/lib/bisq-${_binname}.desktop" "${pkgdir}/usr/share/applications/bisq.desktop"
  ln -s "/opt/bisq/lib/${_binname}.png" "${pkgdir}/usr/share/pixmaps/bisq.png"
}
