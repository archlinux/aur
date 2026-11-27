# Maintainer: Kaarel <github.com/kaareloun>
# Installs the prebuilt binary from the GitHub release. Updated by .github/workflows/release.yml.
pkgname=lookout-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, good-looking system monitor with Rosé Pine themes, an htop replacement with a GUI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/kaareloun/lookout"
license=('MIT')
depends=('gcc-libs' 'glibc' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
provides=('lookout')
conflicts=('lookout')
options=('!debug')
source_x86_64=("lookout-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/lookout-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('65db29be14e0b380410c5d1be570a2f3edbf0b7477b68f1a5bb7f43794dc8c23')

package() {
  cd "lookout-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 lookout "$pkgdir/usr/bin/lookout"
  install -Dm644 lookout.desktop "$pkgdir/usr/share/applications/lookout.desktop"
  for s in 32 48 64 128 256 512; do
    install -Dm644 "icons/lookout-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/lookout.png"
  done
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/lookout.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
