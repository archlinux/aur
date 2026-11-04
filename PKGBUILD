# Maintainer: Davide Briani <116493713+brianidavide@users.noreply.github.com>
#
# Kalipso from a published version, already built: the files the release workflow compiled on Arch
# Linux against Arch's own Qt (tools/build-arch-tarball.sh). Nothing is compiled on your computer.
# The release workflow writes pkgver and the checksum and pushes this file to AUR; in the repository
# it is the template.

pkgname=kalipso-bin
pkgver=2.7
pkgrel=1
pkgdesc='Teleprompter that keeps your place: follows your voice on your computer, scrolls at a steady pace or waits for your pedal (prebuilt)'
arch=('x86_64')
url='https://sansevieria-ou.github.io/kalipso/'
license=('AGPL-3.0-or-later')
# pipewire: pw-record captures the microphone.
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libpipewire' 'libstdc++' 'pipewire' 'qt6-base' 'qt6-svg')
optdepends=('plasma-workspace: the Plasma widget and the KWin script'
            'gnome-shell: the GNOME Shell extension'
            'xdg-desktop-portal: reader colours from the window behind')
provides=('kalipso')
conflicts=('kalipso' 'kalipso-git')
options=('!strip' '!debug')
source=("https://github.com/SANSEVIERIA-OU/kalipso/releases/download/v$pkgver/kalipso-$pkgver-archlinux-x86_64.tar.zst")
noextract=("kalipso-$pkgver-archlinux-x86_64.tar.zst")
sha256sums=('3eb7d062b8600848f2c9b4f97d5743c2a66544f7b9324661f97404dbab7fe1dd')

package() {
  # The files are packed owned by root; makepkg records every file as root anyway.
  tar -C "$pkgdir" --zstd --no-same-owner -xf "kalipso-$pkgver-archlinux-x86_64.tar.zst"
}
