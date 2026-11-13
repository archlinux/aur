# Maintainer: Fred Junior <fredjunior54@users.noreply.github.com>
pkgname=aula-f75-rs-bin
pkgver=0.1.29
pkgrel=1
pkgdesc='GUI and CLI configuration tool for the AULA F75 keyboard (prebuilt binary)'
arch=('x86_64')
url='https://github.com/fredjunior54/aula-f75-rs'
license=('MIT' 'OFL-1.1')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'systemd-libs')
optdepends=(
  'libglvnd: OpenGL loader (glow backend)'
  'mesa: OpenGL implementation (glow backend)'
  'libx11: X11/XWayland backend'
  'libxcursor: X11 cursor support'
  'libxi: X11 input support'
  'libxrender: X11 rendering'
  'libxkbcommon: keyboard layout handling'
  'libxkbcommon-x11: X11 keyboard layout handling'
  'wayland: native Wayland backend'
)
provides=('aula-f75')
conflicts=('aula-f75')
options=('!strip' '!debug')
source=("aula-f75-v$pkgver-x86_64-unknown-linux-gnu.tar.gz::https://github.com/fredjunior54/aula-f75-rs/releases/download/v$pkgver/aula-f75-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('412efdb6cd420f2275bc0a4a34f37b8c743692418a6cf744650d5839191e644d')

package() {
  local dir="$srcdir/aula-f75-v$pkgver-x86_64-unknown-linux-gnu"
  local size

  install -Dm755 "$dir/aula-f75" "$pkgdir/usr/bin/aula-f75"
  install -Dm644 "$dir/packaging/aula-f75-rs.desktop" \
    "$pkgdir/usr/share/applications/aula-f75-rs.desktop"
  install -Dm644 "$dir/udev/70-aula-f75.rules" \
    "$pkgdir/usr/lib/udev/rules.d/70-aula-f75.rules"

  for size in 64 128 256; do
    install -Dm644 "$dir/icons/hicolor/${size}x${size}/apps/aula-f75-rs.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/aula-f75-rs.png"
  done

  install -Dm644 "$dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$dir/LICENSES/aula-f75-hub-MIT.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/aula-f75-hub-MIT.txt"
  install -Dm644 "$dir/assets/LICENSE-NerdFonts.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-NerdFonts.txt"

  install -Dm644 "$dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
