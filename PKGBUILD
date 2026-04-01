# Maintainer: Gregory Anders <greg at gpanders dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: kaij <contact at kaij dot tech>
# Maintainer (nightly-bin): jmp0

pkgbase=ghostty-nightly-bin
pkgname=(ghostty-nightly-bin ghostty-shell-integration-nightly-bin ghostty-terminfo-nightly-bin)
pkgver=20260401.r15694.gb7e5604
pkgrel=1
pkgdesc="Fast, native, feature-rich terminal emulator pushing modern features"
arch=(x86_64)
url="https://github.com/ghostty-org/ghostty"
license=(MIT)
# Use release-specific local source names so makepkg/paru never reuses stale nightly archives.
_source_rev="${pkgver}-${pkgrel}"
depends=(
  bzip2
  fontconfig
  freetype2
  gcc-libs
  glibc
  glib2
  gtk4
  gtk4-layer-shell
  libx11
  harfbuzz
  libadwaita
  libpng
  oniguruma
  pixman
  wayland
  zlib
)
source=(
  "ghostty-nightly-bin-${_source_rev}-x86_64.tar.zst::https://github.com/jpenilla/ghostty-nightly-bin/releases/download/nightly/ghostty-nightly-bin-x86_64.tar.zst"
  "ghostty-terminfo-nightly-bin-${_source_rev}-x86_64.tar.zst::https://github.com/jpenilla/ghostty-nightly-bin/releases/download/nightly/ghostty-terminfo-nightly-bin-x86_64.tar.zst"
  "ghostty-shell-integration-nightly-bin-${_source_rev}-x86_64.tar.zst::https://github.com/jpenilla/ghostty-nightly-bin/releases/download/nightly/ghostty-shell-integration-nightly-bin-x86_64.tar.zst"
)
sha256sums=(
  '3ff640f4f034db12ed9585b0abc86213f1f1a639b2def48bf4f7294d4d4836da'
  'b302a9cbd41ed121a4626803d897d4b4f744b6e79b537fbb3a7ee15d03777b51'
  '09c67f4a6b0093babad26a5aab0840b182d4cdb250ead6ac954d21425c8f655f'
)

package_ghostty-nightly-bin() {
  depends+=(ghostty-shell-integration-nightly-bin ghostty-terminfo-nightly-bin)
  provides=("ghostty=$pkgver")
  conflicts=(ghostty ghostty-git)

  bsdtar -xf "${srcdir}/ghostty-nightly-bin-${_source_rev}-x86_64.tar.zst" -C "$pkgdir"
}

package_ghostty-shell-integration-nightly-bin() {
  pkgdesc='Shell integration scripts for ghostty'
  depends=()
  provides=("ghostty-shell-integration=$pkgver")
  conflicts=(ghostty-shell-integration ghostty-shell-integration-git)

  bsdtar -xf "${srcdir}/ghostty-shell-integration-nightly-bin-${_source_rev}-x86_64.tar.zst" -C "$pkgdir"
}

package_ghostty-terminfo-nightly-bin() {
  pkgdesc='Terminfo for ghostty'
  depends=()
  provides=("ghostty-terminfo=$pkgver")
  conflicts=(ghostty-terminfo ghostty-terminfo-git)

  bsdtar -xf "${srcdir}/ghostty-terminfo-nightly-bin-${_source_rev}-x86_64.tar.zst" -C "$pkgdir"
}
