# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>
# Contributor: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Clarence <xjh.azzbcc@gmail.com>
pkgname="ocenaudio-bin"
_pkgname=ocenaudio
pkgver=3.19.5
pkgrel=1
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('x86_64')
url="https://www.ocenaudio.com/"
license=('custom')
depends=('hicolor-icon-theme' 'jack' 'libpulse' 'qt6-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}_x86_64.tar.zst::https://www.ocenaudio.com/downloads/index.php/ocenaudio_archlinux.pkg.tar.zst?version=v${pkgver}")
sha512sums=('c5e681406f7490d78daa2995c27492e3860e129ac8e4facf31e778ac175177b12c424cc76166ec6f3e27252c6fd65dbdf42c4f4283b7ec5e4125e946a60bb0b6')

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
