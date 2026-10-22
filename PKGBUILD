# Maintainer: Teejer <teejer@users.noreply.github.com>
pkgname=linauth
pkgver=0.1.5
pkgrel=1
pkgdesc='Native GTK4/libadwaita TOTP/HOTP authenticator that imports WinAuth backups'
arch=('x86_64')
url='https://github.com/Teejer/linauth'
license=('GPL3')
depends=('gtk4' 'libadwaita')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a72085f12416d3afe790aa0f80a52a14a37d4154d93de4aff9ad9f2ff6fdd349')

build() {
  cd "$pkgname-$pkgver/app"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver/app"
  cargo test --release --locked
}

package() {
  cd "$pkgname-$pkgver/app"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "data/io.github.teejer.LinAuth.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.teejer.LinAuth.svg"
  desktop="$pkgdir/usr/share/applications/io.github.teejer.LinAuth.desktop"
  install -dm755 "$(dirname "$desktop")"
  sed 's|@PREFIX@|/usr|g' data/io.github.teejer.LinAuth.desktop.in > "$desktop"
}
