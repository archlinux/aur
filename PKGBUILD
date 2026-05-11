# Maintainer: Arnaud Gissinger <claude@mathix.dev>

pkgname=alacritree-bin
_pkgname=alacritree
pkgver=0.2.0
pkgrel=1
pkgdesc="Alacritty fork with worktree-aware sidebars (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/mathix420/alacritree"
license=('Apache-2.0')
depends=(
  'fontconfig'
  'freetype2'
  'libxkbcommon'
  'libxcb'
  'wayland'
  'libglvnd'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'alacritree-git')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-linux.tar.gz")
# Hashes are filled in by .github/workflows/aur-bin-publish.yml before the
# manifest is shipped to AUR.
sha256sums_x86_64=('e462965e9c57bd32274a06cbbbcb6698dba631236a9b767958c30969b92aee35')
sha256sums_aarch64=('9a6a1e753de747f31b3f41f32f71608186e8e04aea01ebd4213c7eb242e4355b')

package() {
  install -Dm755 "$srcdir/alacritree" "$pkgdir/usr/bin/alacritree"
  install -Dm644 "$srcdir/alacritree.desktop" \
    "$pkgdir/usr/share/applications/alacritree.desktop"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "$srcdir/alacritree-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/alacritree.png"
  done
}
