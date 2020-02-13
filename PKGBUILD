# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL3')
depends=('java-runtime' 'gtk2' 'libnet')
validpgpkeys=('CB36D7D2EBB2E35D9B75500BCD5DC1C529CDFD3B')
source_x86_64=("https://github.com/bisq-network/bisq/releases/download/v${pkgver}/Bisq-64bit-${pkgver}.deb"{,.asc})
sha512sums_x86_64=('ca8ba3cd2855426f562b2a2608dd1c3af11c9955fe8056b20eef25b167a6b20f0254ce8a3b8ff20619e90b6f26a4c740f6693dcc6337d2d47d76ca616ae86213'
                   '2dfaffbce728b3ea4f551f1ed0678200accc74b3adeff2d82ecd26a4ad809e132563b3908c8323d6b75ec962c241f9e623d8e2aa46c3a7caa9b5d2da7a1e5206')
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
