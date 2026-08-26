# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=bisq-bin
pkgver=1.10.7
pkgrel=1
pkgdesc="Cross-platform desktop application that allows users to trade national currency (dollars, euros, etc) for bitcoin without relying on centralized exchanges"
arch=('x86_64')
url="https://bisq.network"
license=('AGPL-3.0-only')
depends=('java-runtime')
validpgpkeys=('B493319106CC3D1F252E19CBF806F422E222AA02'
              'B8A5D214ADFAA387A14C8BCF02AA2BAE387C8307')
source_x86_64=("https://github.com/bisq-network/bisq/releases/download/v${pkgver}/Bisq-64bit-${pkgver}.deb"{,.asc})
sha512sums_x86_64=('380b0abfceef9be466e5f32af01ae470b19cb019f02e949fd97ae9dbf1cb5a0ca9cde6df926ad03fdb62a869410ba4fb490adc67aaac3e09b0291192d4b8efcc'
                   'SKIP')
_binname=Bisq
conflicts=("bisq" "bisq-git")
provides=("bisq-bin")

prepare() {
  tar --zstd -xvf data.tar.xz
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
