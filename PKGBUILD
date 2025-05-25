# Maintainer: envolution
# Contributor: Hauke Rehfeld <aur@haukerehfeld.de>
# Contributor: Retro Gamer <https://github.com/eGax>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=trenchbroom-bin
pkgver=2025.3
pkgrel=1
pkgdesc="Level editor supporting Daikatana, D-DayNormandy, Digital Paintball 2, Half-life, Heretic 2, Hexen 2, Kingpin, Neverball, Quake, Quake 2, Quake 3, Quetoo, and Wrath."
arch=("x86_64")
url="https://trenchbroom.github.io/"
license=("GPL-3.0-or-later")
conflicts=("trenchbroom")
provides=("trenchbroom")
options=(!strip)

source=("https://github.com/TrenchBroom/TrenchBroom/releases/download/v${pkgver}/TrenchBroom-Linux-x86_64-v${pkgver}-Release.zip")
sha256sums=('082e9a4e40c52b0b5961f0ea692f174250bb7804712c4f9ebbb8d31b995ee919')

prepare() {
  # Make sure the AppImage is executable and extract its contents
  chmod +x TrenchBroom.AppImage
  ./TrenchBroom.AppImage --appimage-extract
}

package() {
  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -d "$pkgdir/usr/share/licenses/trenchbroom/fonts"
  install -d "$pkgdir/usr/share/TrenchBroom"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/opt/TrenchBroom"

  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256/apps/trenchbroom.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/trenchbroom.png"

  install -Dm644 squashfs-root/usr/share/TrenchBroom/LICENSE.txt \
    "$pkgdir/usr/share/licenses/trenchbroom/LICENSE.txt"
  install -Dm644 squashfs-root/usr/share/TrenchBroom/fonts/SIL\ Open\ Font\ License.txt \
    "$pkgdir/usr/share/licenses/trenchbroom/fonts/SIL Open Font License.txt"

  cp -r squashfs-root/* "$pkgdir/opt/TrenchBroom/"
  chmod -R u+rx "$pkgdir/opt/TrenchBroom"
  ln -s "/opt/TrenchBroom/usr/bin/trenchbroom" "$pkgdir/usr/bin/trenchbroom"
  install -Dm644 squashfs-root/trenchbroom.desktop "$pkgdir/usr/share/applications/trenchbroom.desktop"
  chmod 644 "$pkgdir/usr/share/applications/trenchbroom.desktop"
}

# vim:set ts=2 sw=2 et:
