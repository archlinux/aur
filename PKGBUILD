# Maintainer: pisevren <aur@local>
# Contributor: Timo S. Prinz <t.prinz@coliza.de>

pkgname=librevna-gui-bin
pkgver=1.6.5
pkgrel=2
pkgdesc="GUI application for the LibreVNA, a 100kHz to 6GHz 2 port USB based VNA"
arch=('x86_64')
url="https://github.com/jankae/LibreVNA"
license=('GPL-3.0-only')

depends=('qt6-base' 'qt6-svg')
optdepends=(
  'librevna-firmware: firmware files and default firmware path for device update'
  'librevna-udev: udev rules for LibreVNA device access'
  'librecal-udev: udev rules for LibreCAL control'
)

provides=('librevna-gui')
conflicts=('librevna-gui')

source=(
  "https://github.com/jankae/LibreVNA/releases/download/v${pkgver}/LibreVNA-GUI-Ubuntu-v${pkgver}.zip"
  "librevna-src-v${pkgver}.tar.gz::https://github.com/jankae/LibreVNA/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('667d57bfd514923f2e581aa8c4cf98ca06be5765d6bae9d499180642fbcb9054'
            '63f924d9c9fb258a379de94f922a2a4a6d2fa6552ebab63fbb91cc29a5d6aee4')

package() {
  install -Dm755 \
    "$srcdir/LibreVNA-GUI" \
    "$pkgdir/usr/bin/LibreVNA-GUI"

  ln -s "LibreVNA-GUI" \
    "$pkgdir/usr/bin/librevna-gui"

  install -d "$pkgdir/usr/share/doc/librevna"

  cp -r \
    "$srcdir/LibreVNA-${pkgver}/Documentation/"* \
    "$pkgdir/usr/share/doc/librevna/"
}
