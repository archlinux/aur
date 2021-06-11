# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-bin
pkgver=1.6.5
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk-openjdk')
validpgpkeys=('CB36D7D2EBB2E35D9B75500BCD5DC1C529CDFD3B')
source_x86_64=("https://github.com/bisq-network/bisq/releases/download/v${pkgver}/Bisq-64bit-${pkgver}.deb"{,.asc})
sha512sums_x86_64=('32da5f7bdf89eb3dc9b7c08df4199a4fe8272e1006d42cbbde1ea1802bfec98493e9e879e2331fa056c21e4f0c3f31285e0cdf9360ec97a25f968da906d05c29'
                   'dd686642d75389b6bf28e0db07a2aedc4c87c138446cd715aa350a60e45ab101b6f15dbddd469cc269318cc9a47e89c58e2df2b7a6315a17fe2661554f730016')
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
