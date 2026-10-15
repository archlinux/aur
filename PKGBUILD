# Maintainer: flaviofearn <heroicgameslauncher@protonmail.com>
# Maintainer: CommandMC <kate@commandmc.de>

pkgver=2.22.4
pkgrel=1
sha256sums=('a5a798ee49bb4a20d3d163f46f39382389974cf4f818b49aa715e1b74d2a0eb0')

pkgname=heroic-games-launcher-bin
pkgdesc="An Open Source Launcher for GOG, Epic Games and Amazon Games"
arch=('x86_64')
url="https://heroicgameslauncher.com/"
license=('GPL-3.0-only')
source=("https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v${pkgver}/Heroic-${pkgver}-linux-x64.pacman")
noextract=("${source[@]##*/}")
depends=(
  "which"

  # Electron dependencies
  "gtk3"
  "nss"
  "alsa-lib"
  "libcups"
  "nspr"
  "at-spi2-core"

  # Required by some helper binaries
  "python"
  "libgcc"
  "glibc"
  "zlib"
)
optdepends=(
  "gamemode"
  "gamescope"
  "mangohud"
  "rsync: Move games using rsync instead of mv"
)
provides=(heroic-games-launcher)
conflicts=(heroic-games-launcher)

package() {
  tar --extract --xz --directory="$pkgdir" --file="$srcdir/Heroic-${pkgver}-linux-x64.pacman" usr opt
  mkdir "$pkgdir/usr/bin"
  ln -s "/opt/Heroic/heroic" "$pkgdir/usr/bin/heroic"
}
