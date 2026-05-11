# Maintainer: Arnaud Gissinger <claude@mathix.dev>

pkgname=alacritree-bin
_pkgname=alacritree
pkgver=0.1.2
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
sha256sums_x86_64=('649ebf590c1c78185495c41e4a262c6e070a170a461ffe4a1ab6dc450e076c35')
sha256sums_aarch64=('b235a0ae04ed7616f392ceb03a3fa37630f80f8119efa4219ee04fee82091f56')

package() {
  install -Dm755 "$srcdir/alacritree" "$pkgdir/usr/bin/alacritree"
  install -Dm644 "$srcdir/alacritree.desktop" \
    "$pkgdir/usr/share/applications/alacritree.desktop"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "$srcdir/alacritree-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/alacritree.png"
  done
}
