# Maintainer: Daazed McFarland <daazedjmcfarland@gmail.com>
#
# AUR binary repackaging of Trickster's first-party Arch package. The source
# package lives in packaging/arch/; this pkgbase exists for AUR users who do
# not want to build Flutter from source.

pkgbase=trickster-bin
pkgname=trickster-bin
# Keep in sync with pubspec.yaml, Cli.appVersion, and packaging/arch.
pkgver=0.2.1
pkgrel=1
pkgdesc='Flutter-native Wayland status bar (prebuilt binary)'
arch=('x86_64')
url='https://github.com/dazemc/trickster'
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'fontconfig'
  'glibc'
  'gtk-layer-shell'
  'gtk3'
  'libglvnd'
  'libpipewire'
  'libxkbcommon'
  'mesa'
  'systemd-libs'
)
provides=('trickster')
conflicts=('trickster' 'trickster-git')
backup=('etc/trickster/session.conf')
# The release archive is stripped as a whole already: the Dart AOT
# tricksterctl breaks under strip, so it must pass through untouched.
options=('!strip' '!debug')
source=(
  "https://github.com/dazemc/trickster/releases/download/v${pkgver}/trickster-${pkgver}-1-x86_64.pkg.tar.zst"
)
sha256sums=('293a8e3e1aadc4e0b18fd86ae2934fcc503c8cf9e23afc1ed8fa0c0bf8ea222a')
noextract=("trickster-${pkgver}-1-x86_64.pkg.tar.zst")

package() {
  bsdtar -xpf "$srcdir/trickster-${pkgver}-1-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
