# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sonora-tui-bin
pkgver=0.20.0
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
sha256sums_x86_64=('5322ab2938212881286086ce14e9b1a8c2c8d158bc4168c0fecb5bf3e743f1d6')
sha256sums_aarch64=('bf1a2343ee0713d9b31c6072e5e33b36713145d02f20754cb08c0633d42ae94a')

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
