# Maintainer: posprint contributors
pkgname=posprint
pkgver=0.5.5
pkgrel=1
pkgdesc="Designer for POS-print documents with live preview and USB ESC/POS printing"
arch=('x86_64')
url="https://gitlab.com/Timfa/posprint"
license=('MIT')
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
source=("https://gitlab.com/Timfa/posprint/-/archive/${pkgver}/posprint-${pkgver}.tar.gz")
sha256sums=('b781971762898ea1ee5e306e3d58eec7c7f4e5620379bd9d869b788a07636091')

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
