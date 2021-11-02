# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=highscore-git
pkgver=40.0.r251.gea4d847d
pkgrel=1
pkgdesc="Highscore is a retro gaming application for the GNOME desktop"
arch=('x86_64')
url="https://gitlab.gnome.org/World/highscore"
license=('GPL3')
depends=('tracker' 'grilo' 'grilo-plugins' 'glib2' 'gtk4' 'libadwaita' 'libmanette' 'libarchive' 'retro-gtk-git' 'librsvg' 'libsoup' 'sqlite' 'libxml2')
makedepends=('git' 'cmake' 'meson' 'gcc' 'vala')
optdepends=('kodi-addon-game-libretro: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-beetle-psx: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-desmume: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-flycast: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-gambatte: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-melonds: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-mgba: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-mupen64plus-nx: Nintendo64 mupen64plus-next for kodi'
  'kodi-addon-game-libretro-nestopia: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-parallel-n64: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-scummvm: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-snes9x: Libretro wrapper for Kodis Game API'
  'kodi-addon-game-libretro-yabause: Libretro wrapper for Kodis Game API'
  'libretro-beetle-pce: NEC PC Engine/SuperGrafx/CD core'
  'libretro-beetle-pce-fast: NEC PC Engine/CD core'
  'libretro-beetle-psx: Sony PlayStation core'
  'libretro-beetle-psx-hw: Sony PlayStation core'
  'libretro-beetle-supergrafx: NEC SuperGrafx core'
  'libretro-blastem: Sega Mega Drive core'
  'libretro-bsnes: Super Nintendo Entertainment System cores'
  'libretro-bsnes2014: Super Nintendo Entertainment System cores'
  'libretro-bsnes-hd: Super Nintendo Entertainment System core'
  'libretro-citra: Nintendo 3DS core'
  'libretro-core-info: Libretro core info files'
  'libretro-desmume: Nintendo DS core'
  'libretro-dolphin: Nintendo GC/Wii core'
  'libretro-duckstation: Sony PlayStation core'
  'libretro-flycast: Sega Dreamcast core'
  'libretro-gambatte: Nintendo Game Boy/Game Boy Color core'
  'libretro-genesis-plus-gx: Sega MS/GG/MD/CD core'
  'libretro-kronos: Sega Saturn core'
  'libretro-melonds: Nintendo DS core'
  'libretro-mesen: Nintendo Entertainment System core'
  'libretro-mesen-s: Super Nintendo Entertainment System core'
  'libretro-mgba: Nintendo Game Boy Advance core'
  'libretro-mupen64plus-next: Nintendo 64 core'
  'libretro-nestopia: Nintendo Entertainment System core'
  'libretro-overlays: Collection of overlays for libretro'
  'libretro-parallel-n64: Nintendo 64 core'
  'libretro-pcsx2: Sony PlayStation 2 core'
  'libretro-picodrive: Sega MS/MD/CD/32X core'
  'libretro-play: Sony PlayStation 2 core'
  'libretro-ppsspp: Sony PlayStation Portable core'
  'libretro-retrodream: Sega Dreamcast core'
  'libretro-sameboy: Nintendo Game Boy/Game Boy Color core'
  'libretro-scummvm: ScummVM core'
  'libretro-shaders-slang: Collection of shaders for libretro'
  'libretro-snes9x: Super Nintendo Entertainment System core'
  'libretro-yabause: Sega Saturn core'
  'retroarch: Reference frontend for the libretro API')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=('gnome-games')
source=(git+$url.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
