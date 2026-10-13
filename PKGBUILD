# Maintainer: chuma-beep
pkgname=enclose-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="Desktop workbench for CAD projects built from code, with a Claude handoff"
arch=('x86_64')
url="https://github.com/chuma-beep/arch-enclose"
license=('AGPL-3.0-only')
options=('!debug')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify')
# Built with electron-builder from the arch-enclose fork (AppImage/deb/pacman/rpm
# all come out of apps/desktop: npm run dist). Repacked here instead of rebuilt.
source=("Enclose-$pkgver-x64.pacman::https://github.com/chuma-beep/arch-enclose/releases/download/v$pkgver/Enclose-$pkgver-x64.pacman")
sha256sums=('1d550e6e9f1e2b77a82677d1fa9e20238bf207b9af8a33f16f69ea104730d811')

package() {
  # The pacman artifact is itself a package: unpack it, minus its own metadata.
  bsdtar -xf "$srcdir/Enclose-$pkgver-x64.pacman" -C "$pkgdir" \
    --exclude .PKGINFO --exclude .MTREE --exclude .INSTALL
}
