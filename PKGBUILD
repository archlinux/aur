# Maintainer: Gregory Anders <greg at gpanders dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: kaij <contact at kaij dot tech>
# Maintainer (nightly-bin): jmp0

pkgbase=ghostty-nightly-bin
pkgname=(ghostty-nightly-bin ghostty-shell-integration-nightly-bin ghostty-terminfo-nightly-bin)
pkgver=20260517.r16139.ge90b7c9
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
  '2bd023a7c121df231f25c78cf691dddbeb51a7ec431d5ea53c21128d5f74f784'
  '48481325cbd039db5d965ef3f3d86cfa47a784af05515e3277850edce437da12'
  'aad09eeefee7b82592ea1a413583f1264f173c58a26b7d82b4b2d8d33f8ef66e'
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
