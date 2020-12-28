# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL3')
depends=('jdk11-openjdk' 'gtk2' 'libnet')
validpgpkeys=('CB36D7D2EBB2E35D9B75500BCD5DC1C529CDFD3B')
source_x86_64=("https://github.com/bisq-network/bisq/releases/download/v${pkgver}/Bisq-64bit-${pkgver}.deb"{,.asc})
sha512sums_x86_64=('8abaebdd32ade05f3e5a91e9e9f1e8f7bfb429b54716ea81031f284ad064910483f63ce83466a19be595109b2f9193216dcd29e64669e6534743e3cfc0af1e13'
                   '02aa3d692d497dd9f00c76d4d258aab1f0ceada8b5498fbc1eab7e642fc8a0a3e4959e45760dc5f5e0b4423c2964a303a347b72a2db0a1b5d1ad765ad82194af')
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
