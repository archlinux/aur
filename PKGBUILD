# Maintainer: loki5512344 <mauhhhh7@gmail.com>

pkgname=wherry
pkgver=0.1.0
pkgrel=2
pkgdesc="A modern dual-pane file manager with SFTP/FTP/FTPS support"
arch=('x86_64')
url='https://github.com/loki5512344/Wherry'
license=('GPL3')
depends=(
  'gcc-libs'
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'librsvg'
  'openssl'
  'libssh2'
  'dbus'
)
makedepends=('cargo' 'pkg-config')
optdepends=('mold: faster linking')
source=("https://github.com/loki5512344/Wherry/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f0ad6e308cf20439820b19136cb9113cb9b76e7cc81275248d5dd8fed812ea8')

_repodir="Wherry-$pkgver"

prepare() {
  cd "$srcdir/$_repodir"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_repodir"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --frozen
}

package() {
  cd "$srcdir/$_repodir"
  install -Dm755 "$srcdir/target/release/wherry" "$pkgdir/usr/bin/wherry"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 src/icons/128x128.png "$pkgdir/usr/share/pixmaps/wherry.png"
  install -Dm644 dist/wherry.desktop "$pkgdir/usr/share/applications/wherry.desktop"
}
