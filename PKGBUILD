# Maintainer: Muhammed Dali <muhammeddardali at users dot noreply dot github dot com>

pkgname=ardali-gaming-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Linux game launcher and compatibility manager for Wine, Proton and Steam'
arch=('x86_64')
url='https://github.com/Muhammed-Dali/ArDali-Gaming'
license=('GPL-3.0-only')
depends=('fuse2')
optdepends=(
  'gamemode: per-game performance optimization'
  'gamescope: game scaling and display isolation'
  'libsecret: secure SteamGridDB API key storage'
  'steam: Steam library integration and game launching'
)
provides=('ardali-gaming')
conflicts=('ardali-gaming')
options=('!strip')
source=(
  "com.ardali.gaming.desktop::https://raw.githubusercontent.com/Muhammed-Dali/ArDali-Gaming/v${pkgver}/packaging/linux/ardali-gaming.desktop"
  "ardali-gaming.png::https://raw.githubusercontent.com/Muhammed-Dali/ArDali-Gaming/v${pkgver}/src-tauri/icons/icon.png"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/Muhammed-Dali/ArDali-Gaming/v${pkgver}/LICENSE"
)
source_x86_64=(
  "https://github.com/Muhammed-Dali/ArDali-Gaming/releases/download/v${pkgver}/ArDali.Gaming_${pkgver}_amd64.AppImage"
)
noextract=("ArDali.Gaming_${pkgver}_amd64.AppImage")
sha256sums=(
  'e96d4e969c2dd217561c95a74b2c73ba4b1258d000021490989381260670bd53'
  'a6e16932ab0367649a6e36088c26b99d65a0c611f80725e61afe77cdf0a4abb9'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)
sha256sums_x86_64=(
  '2873441d27680395c9f04d642971857bd04cacb8bb594686cab89378b188fe2d'
)

package() {
  install -Dm755 "ArDali.Gaming_${pkgver}_amd64.AppImage" \
    "${pkgdir}/opt/ardali-gaming/ardali-gaming.AppImage"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/ardali-gaming/ardali-gaming.AppImage \
    "${pkgdir}/usr/bin/ardali-gaming"

  install -Dm644 com.ardali.gaming.desktop \
    "${pkgdir}/usr/share/applications/com.ardali.gaming.desktop"
  install -Dm644 ardali-gaming.png \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/ardali-gaming.png"
  install -Dm644 "LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
