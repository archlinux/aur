# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>
# Contributor: John Gleezowood <psyrccio@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Clarence <xjh.azzbcc@gmail.com>
pkgname="ocenaudio-bin"
_pkgname=ocenaudio
pkgver=3.20.4
pkgrel=1
pkgdesc="Cross-platform, easy to use, fast and functional audio editor"
arch=('x86_64')
url="https://www.ocenaudio.com/"
license=('custom')
depends=('hicolor-icon-theme' 'jack' 'libpulse' 'qt6-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}_x86_64.tar.zst::https://www.ocenaudio.com/downloads/index.php/ocenaudio_archlinux.pkg.tar.zst?version=v${pkgver}")
sha512sums=('c80c239d6fb5aee8187d4e092cfed47b0bcf99ea43bc40ffa8063d0894e5afec502931bfad41ad1da4c46598496455b3c643d536a825891b2655371d9c88732b')

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
