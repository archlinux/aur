# Maintainer: Nasir <https://github.com/NasirA1991>
pkgname=honrp-bin
pkgver=0.3.4
pkgrel=2
pkgdesc='Discord Rich Presence for Heroes of Newerth (Juvio) on Linux/Steam Proton'
arch=('x86_64')
url='https://github.com/NasirA1991/honrp'
license=('MIT')
provides=('honrp')
conflicts=('honrp')
options=('!strip')
source=(
  "honrp-${pkgver}-x86_64-linux.tar.gz::https://github.com/NasirA1991/honrp/releases/download/v${pkgver}/honrp-v${pkgver}-x86_64-linux.tar.gz"
)
sha256sums=('7f27cd931a88012791e8216446a7eb160b637954ac4ca586f117bfa3f1303c09')
depends=('glibc' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'vulkan-icd-loader' 'hicolor-icon-theme')

package() {
  tar -xzf "$srcdir/honrp-${pkgver}-x86_64-linux.tar.gz" -C "$srcdir"
  install -Dm755 "$srcdir/honrp-linux-x86_64" "$pkgdir/usr/bin/honrp"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/config.example.json" "$pkgdir/usr/share/honrp/config.example.json"
  install -Dm644 "$srcdir/honrp.desktop" "$pkgdir/usr/share/applications/honrp.desktop"
  for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512; do
    install -Dm644 "$srcdir/icons/hicolor/$size/apps/honrp.png" "$pkgdir/usr/share/icons/hicolor/$size/apps/honrp.png"
  done
}

post_install() {
  cat <<'MSG'
Finish setup as your user (not root):
  honrp install
Restart Heroes of Newerth afterwards.
MSG
}
