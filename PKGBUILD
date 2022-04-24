# Maintainer: Andreas Backx

pkgname=spotifatius
pkgver=0.1.0
pkgrel=2
pkgdesc="A simple Spotify CLI primarily made for monitoring what songs you're listening to and displaying that in your bar of choice like waybar or polybar."
arch=('any')
url="https://github.com/AndreasBackx/spotifatius"
license=('MIT')
depends=()
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndreasBackx/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('577662b867893451fd5d2d99196000d2aae83520a6c3802288d0110694992fb4')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"

  OUT_DIR="$(cargo build --release --locked)"

  install -Dm755 "target/release/spotifatius" "$pkgdir/usr/bin/spotifatius"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
