# Maintainer: posprint contributors
pkgname=posprint
pkgver=0.5.9
pkgrel=1
pkgdesc="Designer for POS-print documents with live preview and USB ESC/POS printing"
arch=('x86_64')
url="https://git.timfalken.com/timfa/posprint"
license=('MIT')
conflicts=('posprint-bin')
depends=(
  'gcc-libs'
  'libxkbcommon'
  'libxcb'
  'openssl'
  'dbus'
  'wayland'
  'libx11'
  'fontconfig'
  'freetype2'
  'libglvnd'
)
makedepends=('rust' 'cargo' 'pkgconf' 'git' 'rsync')
options=('!lto')
source=("posprint-${pkgver}.tar.gz::https://git.timfalken.com/api/v1/projects/timfa/posprint/repository/tags/${pkgver}/archive")
sha256sums=('547a2c853848d0d2d2df283e49caf7dccc6636bac0f3b01d638f00d5d846898b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/posprint "$pkgdir/usr/bin/posprint"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 packaging/posprint.desktop "$pkgdir/usr/share/applications/posprint.desktop"
  install -Dm644 packaging/posprint-url.desktop "$pkgdir/usr/share/applications/posprint-url.desktop"
  install -Dm644 packaging/mime/posprint.xml "$pkgdir/usr/share/mime/packages/posprint.xml"
  install -Dm644 packaging/linux/posprint-print.desktop "$pkgdir/usr/share/kio/servicemenus/posprint-print.desktop"
  install -Dm644 packaging/linux/posprint-print-thunar.xml "$pkgdir/usr/share/thunar/uca/posprint-print.xml"
  install -Dm644 pos-logo.png "$pkgdir/usr/share/pixmaps/posprint.png"
}
