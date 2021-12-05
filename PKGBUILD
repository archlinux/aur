# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: jharch <julian dot hossbach at gmx dot de>
# Contributor: Joonas Kärkkäinen <group55 at eth1 dot fi>
pkgname=lexmark-network-scan
pkgver=3.8.0.0
_revision=09232021
pkgrel=1
pkgdesc="Lexmark Network and USB Scan Drivers"
arch=('x86_64')
url="http://www.lexmark.com/"
license=('custom')
depends=('java-runtime' 'sane' 'systemd' 'xorg-xdpyinfo')
optdepends=('sane-frontends: sane scanner frontends'
            'xsane: sane scanner frontend')
provides=('libsane-lexmark_nscan.so=1.0.16')
install="$pkgname.install"
source=("https://downloads.lexmark.com/downloads/drivers/lexmark_network-scan-linux-glibc2_${_revision}_${CARCH}.deb")
sha256sums=('37d0bfeb10cf9ca888e80021287623621184a6f9c005b8f489987f89b0dc9cd6')

package() {
  bsdtar -xvf data.tar.gz -C "$pkgdir"

  # Symlink license files to proper directory
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$pkgdir/usr/share/doc/$pkgname/copyright" "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "$pkgdir/usr/local/lexmark/unix_scan_drivers/docs/LICENSE.TXT" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
