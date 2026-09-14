# Maintainer: Daazed McFarland <daazedjmcfarland@gmail.com>
#
# AUR binary repackaging of Trickster's first-party Arch package. The source
# package lives in packaging/arch/; this pkgbase exists for AUR users who do
# not want to build Flutter from source.

pkgbase=trickster-bin
pkgname=trickster-bin
# Keep in sync with pubspec.yaml, Cli.appVersion, and packaging/arch.
pkgver=0.2.0
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
sha256sums=('eb825ab5b82e21411b80e60985c94d2da0df6f3a53bdebdefacd1d0bf8724c3d')
noextract=("trickster-${pkgver}-1-x86_64.pkg.tar.zst")

package() {
  bsdtar -xpf "$srcdir/trickster-${pkgver}-1-x86_64.pkg.tar.zst" \
    -C "$pkgdir" --exclude .PKGINFO --exclude .BUILDINFO --exclude .MTREE
}
