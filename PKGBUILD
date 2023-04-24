# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=highscore-git
pkgver=40.0.r333.gc324f5f5
pkgrel=1
pkgdesc="A retro gaming application for the GNOME desktop"
arch=('x86_64' 'aarch64')
url="https://wiki.gnome.org/Apps/Games"
license=('GPL3')
depends=('libadwaita' 'libarchive' 'libmanette' 'retro-gtk-git' 'tracker3')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
optdepends=(
  'libretro-beetle-ngp: Support for Neo Geo Pocket and Neo Geo Pocket Color games'
  'libretro-beetle-pce-fast: NEC PC Engine/CD core'
  'libretro-beetle-pce: NEC PC Engine/SuperGrafx/CD core'
  'libretro-beetle-psx-hw: Sony PlayStation core'
  'libretro-beetle-psx: Sony PlayStation core'
  'libretro-beetle-vb: Support for Virtual Boy games'
#  'libretro-beetle-wswan: Support for WonderSwan and WonderSwan Color games'
  'libretro-beetle-supergrafx: NEC SuperGrafx core'
  'libretro-blastem: Sega Mega Drive core'
  'libretro-bsnes-hd: Super Nintendo Entertainment System core'
#  'libretro-bsnes-mercury-balanced: Support for Super Nintendo Entertainment System games'
  'libretro-bsnes2014: Super Nintendo Entertainment System cores'
  'libretro-bsnes: Super Nintendo Entertainment System cores'
  'libretro-citra: Nintendo 3DS core'
  'libretro-core-info: Libretro core info files'
  'libretro-desmume: Nintendo DS core'
#  'libretro-desmume2015: Support for Nintendo DS games'
  'libretro-dolphin: Nintendo GC/Wii core'
  'libretro-duckstation: Sony PlayStation core'
  'libretro-flycast: Sega Dreamcast core'
  'libretro-gambatte: Nintendo Game Boy/Game Boy Color core'
#  'libretro-gearsystem: Support for Game Gear, Master System and SG-1000 games'
  'libretro-genesis-plus-gx: Sega MS/GG/MD/CD core'
  'libretro-handy: Support for Atari Lynx games'
  'libretro-kronos: Sega Saturn core'
  'libretro-melonds: Nintendo DS core'
  'libretro-mesen-s: Super Nintendo Entertainment System core'
  'libretro-mesen: Nintendo Entertainment System core'
  'libretro-mgba: Nintendo Game Boy Advance core'
  'libretro-mupen64plus-next: Nintendo 64 core'
  'libretro-nestopia: Nintendo Entertainment System core'
  'libretro-overlays: Collection of overlays for libretro'
  'libretro-parallel-n64: Nintendo 64 core'
  'libretro-pcsx2: Sony PlayStation 2 core'
  'libretro-picodrive: Sega MS/MD/CD/32X core'
  'libretro-play: Sony PlayStation 2 core'
  'libretro-ppsspp: Sony PlayStation Portable core'
  'libretro-prosystem: Support for Atari 7800 games'
  'libretro-retrodream: Sega Dreamcast core'
  'libretro-sameboy: Nintendo Game Boy/Game Boy Color core'
  'libretro-scummvm: ScummVM core'
  'libretro-shaders-slang: Collection of shaders for libretro'
  'libretro-snes9x: Super Nintendo Entertainment System core'
  'libretro-stella2014: Support for Atari 2600 games'
  'libretro-yabause: Sega Saturn core'
  'retroarch: Reference frontend for the libretro API')
provides=("${pkgname%-git}" 'gnome-games')
conflicts=("${pkgname%-git}" 'gnome-games')
replaces=('gnome-games-git')
source=('git+https://gitlab.gnome.org/World/highscore.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
