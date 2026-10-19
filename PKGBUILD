# Maintainer: mafuzyk
pkgname=kernel-panic-bin
pkgver=4.0.0
pkgrel=1
pkgdesc='Neon arena shooter about keeping one stubborn process alive'
arch=('x86_64')
url='https://github.com/mafuzyk/kernel-panic'
# 4.x is source-available under PolyForm Strict 1.0.0 plus the additional
# permissions shipped in the release archive. The historical 3.x MIT grant is
# included for provenance, not as the 4.x licence.
license=('LicenseRef-PolyForm-Strict-1.0.0-KP')
depends=('alsa-lib' 'dbus' 'fontconfig' 'freetype2' 'glib2' 'glibc'
         'libglvnd' 'libpulse' 'libx11' 'libxcursor' 'libxi' 'libxinerama'
         'libxrandr' 'wayland' 'zlib')
provides=('kernel-panic')
conflicts=('kernel-panic' 'kernel-panic-git')
options=('!strip')
source=(
  'kernel-panic.desktop'
  'launcher.png'
)
source_x86_64=(
  "kernel-panic-${pkgver}-linux-x86_64-player.tar.gz::https://github.com/mafuzyk/kernel-panic/releases/download/v${pkgver}/kernel-panic-${pkgver}-linux-x86_64-player.tar.gz"
)
sha256sums=(
  '87ba1150c3ecf72958ce4017352081d1ed93affa3703eb8805960cd0b5f82fee'
  '3ae4de57c34e4917bc5baf93a5973f7785703c0abd85c036dc0bce8646f5ce39'
)
sha256sums_x86_64=(
  '713cb0146e59d475b100d7f7cc62187dc84987c2a2b60a9420e85b465b76e287'
)

package() {
  local src="$srcdir/kernel-panic-${pkgver}-linux-x86_64-player"
  install -Dm755 "$src/kernel-panic" "$pkgdir/usr/bin/kernel-panic"
  install -Dm644 "$srcdir/kernel-panic.desktop" \
    "$pkgdir/usr/share/applications/kernel-panic.desktop"
  install -Dm644 "$srcdir/launcher.png" \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/kernel-panic.png"

  for file in LICENSE LICENSE-ADDITIONAL-PERMISSIONS.md LICENSE-MIT-3.x; do
    install -Dm644 "$src/$file" "$pkgdir/usr/share/licenses/$pkgname/$file"
  done
  for file in README.txt RELEASE_NOTES.md THIRD_PARTY_NOTICES.txt; do
    install -Dm644 "$src/$file" "$pkgdir/usr/share/doc/$pkgname/$file"
  done
}
