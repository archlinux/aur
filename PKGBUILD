# Maintainer: Kaarel <github.com/kaareloun>
# Installs the prebuilt binary from the GitHub release. Updated by .github/workflows/release.yml.
pkgname=kanbanana-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Kanban board for your Linear issues, with Claude Code built in (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kaareloun/kanbanana"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('xdg-desktop-portal: file picker for attaching images'
            'claude-code: Claude Code integration over MCP')
provides=('kanbanana')
conflicts=('kanbanana')
options=('!debug')
source_x86_64=("kanbanana-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/kanbanana-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('196abc66ebc9193c46e997cef5ceaae9c32fa7371b186989c1f741ec3ecb8542')

package() {
  cd "kanbanana-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 kanbanana "$pkgdir/usr/bin/kanbanana"
  install -Dm644 kanbanana.desktop "$pkgdir/usr/share/applications/kanbanana.desktop"
  # Launchers pick the size they need: ship every common size and the SVG.
  for s in 32 48 64 128 256 512; do
    install -Dm644 "icons/kanbanana-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/kanbanana.png"
  done
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kanbanana.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
