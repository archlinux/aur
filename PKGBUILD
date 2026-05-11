# Maintainer: Arnaud Gissinger <claude@mathix.dev>

pkgname=alacritree-bin
_pkgname=alacritree
pkgver=0.2.5
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
sha256sums_x86_64=('5907e8586077f481dc9c2185f8f304c0e4c488f6e5986c97fb579e3f07573b70')
sha256sums_aarch64=('eaa555d12a8162fc212d00324af19126a0c324a67cfa66c355b543773b0561da')

package() {
  install -Dm755 "$srcdir/alacritree" "$pkgdir/usr/bin/alacritree"
  install -Dm644 "$srcdir/alacritree.desktop" \
    "$pkgdir/usr/share/applications/alacritree.desktop"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "$srcdir/alacritree-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/alacritree.png"
  done
}
