# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=spice-guest-tools-windows
pkgver=0.100
pkgrel=1
pkgdesc='Windows XP, Vista, 7, 8, 2003, 2008, 2012 guest drivers and agent for SPICE-enabled QEMU VMs'
arch=('any')
url="http://www.spice-space.org/"
license=('GPL2')
makedepends=('cdrkit' 'dos2unix')
install=spice-guest-tools-windows.install
source=(http://www.spice-space.org/download/binaries/spice-guest-tools/spice-guest-tools-${pkgver}.exe)
sha256sums=('4b3888c6374c107d2ea7f42f6e9a6c2a3c9b3c9f78bbe758807819754c0d265d')
noextract=("spice-guest-tools-${pkgver}.exe")

build() {
  cd "$srcdir"

  mkdir cdrom
  cat > cdrom/autorun.inf <<EOF
[autorun]
open=spice-guest-tools-${pkgver}.exe
label=SPICE Guest Tools ${pkgver}
EOF
  unix2dos cdrom/autorun.inf
  cp -aL spice-guest-tools-${pkgver}.exe cdrom
  genisoimage -J -o spice-guest-tools.iso cdrom
}

package() {
  cd "$srcdir"

  install -d -m 755 "$pkgdir"/usr/share/spice-guest-tools
  install -m 444 spice-guest-tools.iso "$pkgdir"/usr/share/spice-guest-tools
}
