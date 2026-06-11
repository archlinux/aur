# Maintainer: Arnaud Gissinger <claude@mathix.dev>

pkgname=alacritree-bin
_pkgname=alacritree
pkgver=0.2.9
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
  # Runtime deps for the sidebar diff view: we shell out to `git diff … | delta`.
  'git'
  'git-delta'
)
provides=("$_pkgname")
conflicts=("$_pkgname" 'alacritree-git')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-linux.tar.gz")
# Hashes are filled in by .github/workflows/aur-bin-publish.yml before the
# manifest is shipped to AUR.
sha256sums_x86_64=('a51fc788be1e8b47bbde113a871dc0cfff2ceea127d870b7adc36d1b914b2469')
sha256sums_aarch64=('defda48db30758a3cedf17f236989888fef6aaab89a2c9fb3db54177f5aff9c9')

package() {
  install -Dm755 "$srcdir/alacritree" "$pkgdir/usr/bin/alacritree"
  install -Dm644 "$srcdir/alacritree.desktop" \
    "$pkgdir/usr/share/applications/alacritree.desktop"
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "$srcdir/alacritree-${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/alacritree.png"
  done
}
