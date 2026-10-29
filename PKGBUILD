# Maintainer: loki5512344 <mauhhhh7@gmail.com>

pkgname=wherry
pkgver=0.1.0
pkgrel=5
pkgdesc="A modern dual-pane file manager with SFTP/FTP/FTPS support"
arch=('x86_64')
url='https://git.wihuk.pro/boba/Wherry'
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
makedepends=('cargo' 'pkg-config' 'git')
optdepends=('mold: faster linking')
source=("git+https://git.wihuk.pro/boba/Wherry.git#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('CB67D9090663FFB2E21E0CB0253067914055423B')  # loki5512344

_repodir="Wherry"

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
