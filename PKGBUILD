# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sonora-tui-bin
pkgver=0.22.0
pkgrel=1
pkgdesc="A terminal music player for TIDAL, Spotify, Apple Music, Deezer, YouTube Music, Subsonic"
arch=('x86_64' 'aarch64')
url="https://github.com/ColinTenaguillo/sonora-tui"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/sonora-tui-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/sonora-tui-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('cc7db954674df2c2e30b663121051584d21be6e945f5e2fd604c26a6a71dfdd4')
sha256sums_aarch64=('cdccd8e16c9f95b91531c8c5bf83689ff4ac4359b9c151ee4afaad25cacc9b1a')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="sonora-tui-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="sonora-tui-aarch64-unknown-linux-gnu" ;;
  esac
  cd "$_dir"
  install -Dm755 "sonora-tui" "${pkgdir}/usr/bin/sonora-tui"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
