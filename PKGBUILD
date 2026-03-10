# Maintainer: Gregory Anders <greg at gpanders dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: kaij <contact at kaij dot tech>
# Maintainer (nightly-bin): jmp0

pkgbase=ghostty-nightly-bin
pkgname=(ghostty-nightly-bin ghostty-shell-integration-nightly-bin ghostty-terminfo-nightly-bin)
pkgver=20260310.r15113.gf8a0a45
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
  '06a7661ae68b1a1a72d3f09f6e44fbbd3157e208a4cdf9ae0a298308903641f1'
  'db294d51bb371b33afd01c841a457365592f4f8da54ed0746f84ed1306da0357'
  '505fb8e90df1e3c8b2c88bfae0f66a604d9171c998a9c718b1d962e7a07f90da'
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
