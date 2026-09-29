# Maintainer: Mohammadreza Khani <mohamadkhani14@gmail.com>
# This PKGBUILD is generated/updated by CI (see packaging/arch/publish-aur.sh).
# Hand-edits are fine but will be overwritten on the next tagged release.
# The source-built package lives in packaging/archlinux/PKGBUILD; this -bin
# package installs the prebuilt binaries from the GitHub release tarball.

pkgname=netkeep-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Linux desktop network flow authorization (daemon, CLI, GPUI tray) — prebuilt'
arch=('x86_64')
url='https://github.com/mohamadkhani/netkeep'
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'gtk-update-icon-cache'
  'hicolor-icon-theme'
  'libxkbcommon'
  'libxcb'
  'sqlite'
  'xdotool'
)
optdepends=(
  'vulkan-mesa-layers: GPU stack for GPUI on some setups'
  'systemd-resolved: disable stub listener if using NETKEEP_DNS_FORWARDER on port 53'
)
provides=('netkeep')
conflicts=('netkeep')
# Binaries arrive UPX-packed: stripping them is impossible (no sections) and
# there is nothing to debug-package.
options=('!strip' '!debug')
source_x86_64=("https://github.com/mohamadkhani/netkeep/releases/download/v${pkgver}/netkeep-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
# Checksum is injected by CI from the built tarball (real b2sum, not SKIP).
b2sums_x86_64=('99ab422c896c08d3eccd6e7f52938f8c0628e1789af95394d6f9721d259d272bb04401cf077743195c0f2df8ad9cf4f2458f0c2345ed7115c383ab28a306a3ab')

package() {
  install -Dm755 "$srcdir/netkeepd"     "$pkgdir/usr/bin/netkeepd"
  install -Dm755 "$srcdir/netkeep-cli"  "$pkgdir/usr/bin/netkeep-cli"
  install -Dm755 "$srcdir/netkeep-gpui" "$pkgdir/usr/bin/netkeep-gpui"

  install -Dm644 "$srcdir/netkeepd.service" \
    "$pkgdir/usr/lib/systemd/system/netkeepd.service"
  install -Dm644 "$srcdir/io.logicamp.Netkeep.desktop" \
    "$pkgdir/usr/share/applications/io.logicamp.Netkeep.desktop"
  install -Dm644 "$srcdir/io.logicamp.Netkeep.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.logicamp.Netkeep.svg"
  install -Dm644 "$srcdir/netkeep.conf" \
    "$pkgdir/etc/environment.d/netkeep.conf"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
