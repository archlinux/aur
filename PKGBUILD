# Maintainer: sougstron
pkgname=kanban4ai-bin
pkgver=0.6.8
pkgrel=1
pkgdesc='Native kanban board CLI and TUI driven by AI coding agents (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/sougstron/kanban4ai'
license=('MIT')
depends=('glibc' 'gcc-libs')
optdepends=(
  'tmux: attachable background agent sessions'
  'curl: subscription limits row for claude, grok, zai, synthetic, and yolo; update checks and self-update'
  'libnotify: desktop notifications through notify-send'
  'wl-clipboard: paste images under Wayland'
  'xclip: paste images under X11'
)
provides=("kanban4ai=$pkgver")
conflicts=('kanban4ai')
options=('!strip')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/kanban4ai-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9a86b09129e7961090a22f9c8b17ea822f51f83de1f332473d8d65a9f9a1bac2')
sha256sums_aarch64=('170015677bf7f60da08a98f04841aba33bbce75516f782b3fc933d7b2c82b105')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/kanban4ai-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

package() {
  local release_dir="kanban4ai-v$pkgver-$CARCH-unknown-linux-gnu"

  install -Dm755 "$release_dir/kanban4ai" "$pkgdir/usr/bin/kanban4ai"
  ln -s kanban4ai "$pkgdir/usr/bin/kanban"
  ln -s kanban4ai "$pkgdir/usr/bin/kb"
  install -Dm644 "$release_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$release_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$release_dir/kanban4ai.service" \
    "$pkgdir/usr/lib/systemd/user/kanban4ai.service"
}
