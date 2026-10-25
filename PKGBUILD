# Maintainer: Gregory Anders <greg at gpanders dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: kaij <contact at kaij dot tech>
# Maintainer (nightly-bin): jmp0

pkgbase=ghostty-nightly-bin
pkgname=(ghostty-nightly-bin ghostty-shell-integration-nightly-bin ghostty-terminfo-nightly-bin)
pkgver=20261025.r18405.gcec8b92
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
  'da560909fe4c87af074f666a858778d30be9621d0205b35035ab0cb622ff3aba'
  'dc0ae27d47a4ed4fa3512aa9c86ff79d11129682eb2bded34e9111ecb5e474f9'
  'fbaf1017ebc3dc11b9e6a097ae7775357e932be54a1644e94d7aceaa1ae0299c'
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
