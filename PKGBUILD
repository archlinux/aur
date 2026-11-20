# Maintainer: LIghtJUNction
# SPDX-License-Identifier: MIT
pkgname=zmcl-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='A small native Minecraft launcher built on Project Z (development preview)'
arch=('x86_64')
url='https://github.com/LIghtJUNction/zmcl'
license=('MIT')
depends=('glibc>=2.39' 'libgcc' 'libx11' 'freetype2' 'fontconfig>=2.17.0' 'hicolor-icon-theme' 'curl' 'python>=3.8')
optdepends=(
  'libsecret: Store Microsoft account tokens using a desktop Secret Service'
  'java-runtime: Use an existing Java runtime instead of downloading a managed runtime'
  'openssl: Verify official Horizon launcher signatures'
  'xorg-xwayland: Run the native X11 GUI in a Wayland session'
  'ttf-font: Render the native GUI text'
)
provides=("zmcl=$pkgver")
conflicts=('zmcl')
options=('!strip' '!debug')
source=(
  "zmcl-$pkgver-linux-$CARCH.tar.gz::$url/releases/download/v$pkgver/zmcl-$pkgver-linux-$CARCH.tar.gz"
  'zmcl.desktop'
)
sha256sums=(
  'b15024e99dd1275db15020ef26669f24aaad9026d948dd6683cacac5c7647e0e'
  '62d26944cd3c4aaaf2dd68668332527883b02bca734c893b510996ba19589082'
)

package() {
  cd "zmcl-$pkgver-linux-$CARCH"
  install -Dm755 zmcl "$pkgdir/usr/bin/zmcl"
  install -Dm644 assets/zmcl.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/zmcl.svg"
  install -Dm644 "$srcdir/zmcl.desktop" "$pkgdir/usr/share/applications/zmcl.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/zmcl/README.md"
  install -Dm644 release.json "$pkgdir/usr/share/doc/zmcl/release.json"
  install -Dm644 docs/FEATURES.md "$pkgdir/usr/share/doc/zmcl/FEATURES.md"
}
