# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-bin
pkgver=1.9.14
pkgrel=2
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL-3.0-only')
depends=('java-runtime')
validpgpkeys=('B493319106CC3D1F252E19CBF806F422E222AA02')
source_x86_64=("https://github.com/bisq-network/bisq/releases/download/v${pkgver}/Bisq-64bit-${pkgver}.deb"{,.asc})
sha512sums_x86_64=('d66211b27df787b2eec2e200f4b60f21b3211cd492395c9e2bd3019d76c6e9fa2eb167e4eeaf0a4e229e881b79d8e9f1ac643de804d7521531a96fbb48c3f762'
                   'SKIP')
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
