# Maintainer: Teejer <teejer@users.noreply.github.com>
pkgname=linauth
pkgver=0.1.6
pkgrel=1
pkgdesc='Native GTK4/libadwaita TOTP/HOTP authenticator that imports WinAuth backups'
arch=('x86_64')
url='https://github.com/Teejer/linauth'
license=('GPL3')
depends=('gtk4' 'libadwaita')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6341d2337a899b6c6d2938a35b0370efc12aac90c656fa337fddde9bb2fb00af')

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
