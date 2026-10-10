# Maintainer: antlis <antlis@protonmail.com>
# Installs the prebuilt Linux binary from the GitHub release (no compiling).
pkgname=unbloatedtube-bin
_name=unbloatedtube
pkgver=0.40.0
pkgrel=1
pkgdesc='Lightweight, configurable YouTube desktop client: GPUI, embedded mpv, yt-dlp (prebuilt binary)'
arch=('x86_64')
url='https://github.com/antlis/UnbloatedTube'
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'wayland'
         'vulkan-icd-loader' 'vulkan-driver' 'mpv' 'yt-dlp' 'deno')
# The package was unbloated-youtube-bin before 0.34.0; that name is now a transitional package
# that depends on this one (packaging/aur/transitional), so this one must not conflict with it.
provides=("$_name" 'unbloated-youtube')
conflicts=("$_name")
options=('!strip')
source=("$url/releases/download/v$pkgver/$_name-$pkgver-x86_64-linux.tar.gz")
sha256sums=('fde125be909aa7fbb1f1047d9850a30484509b039bb8f404fa5d098f803c4a5c')

package() {
  cd "$_name-$pkgver-x86_64-linux"
  install -Dm755 "$_name" "$pkgdir/usr/bin/$_name"
  # A short name, and the command's name before 0.34.0 (so key bindings and scripts keep working).
  ln -s "$_name" "$pkgdir/usr/bin/ubt"
  ln -s "$_name" "$pkgdir/usr/bin/unbloated-youtube"
  install -Dm644 "$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"
  install -Dm644 "$_name.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
