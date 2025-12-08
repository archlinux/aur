# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>
# Maintainer: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Maintainer: Clarence <xjh.azzbcc@gmail.com>
pkgname="ocenaudio-bin"
_pkgname=ocenaudio
pkgver=3.16.5
pkgrel=2
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('x86_64')
url="https://www.ocenaudio.com/"
license=('custom')
depends=('hicolor-icon-theme' 'jack' 'libpulse' 'qt6-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}_x86_64.tar.zst::https://www.ocenaudio.com/downloads/index.php/ocenaudio_archlinux.pkg.tar.zst?version=v${pkgver}")
sha512sums=('49b476153934ca4c228ffd078d4bfd81607653c3ef2120ff68d592c74c87713742bcb80c0f4d1e9c76dd71a012a8a531d80a4d2c6ed973f3b8cd2521464c6429')

package() {
  cp -r "$srcdir/opt" "$pkgdir/"
  cp -r "$srcdir/usr" "$pkgdir/"

  sed -i 's|/opt/ocenaudio/bin/ocenaudio|/usr/bin/ocenaudio|' \
    "$pkgdir/usr/share/applications/ocenaudio.desktop"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/ocenaudio/bin/ocenaudio" "$pkgdir/usr/bin/ocenaudio"

  install -Dm644 "$srcdir/opt/ocenaudio/bin/ocenaudio_license.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  rm -rf "$pkgdir/usr/src"
}
