# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sonora-tui-bin
pkgver=0.21.0
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
sha256sums_x86_64=('1cb256a3741295cc5b935e715fa69fb6082c799b9f6bac18878f97ea8b4f14cf')
sha256sums_aarch64=('d33dececbe9bebbf7ce345b618f41404c7b3d7c26cc812cecdf3dc4d75ce02a9')

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
