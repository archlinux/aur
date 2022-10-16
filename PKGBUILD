# Maintainer: Grzegorz Koperwas <admin@grzegorzkoperwas.site>
pkgname=swww
pkgver=0.5.0
pkgrel=0
pkgdesc="Efficient animated wallpaper daemon for wayland, controlled at runtime."
arch=('x86_64' 'aarch64')
url="https://github.com/Horus645/swww"
license=('GPL')
depends=('gcc-libs' 'lz4' 'libxkbcommon')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Horus645/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('194eb58cde544d19756c7d84cdf1290ed3fbaaa7144258d964445c6e146d9ff8')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release 
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/swww" "$pkgdir/usr/bin/swww"
  install -Dm644 "completions/swww.bash" "$pkgdir/usr/share/bash-completion/completions/swww"
  install -Dm644 "completions/swww.fish" "$pkgdir/usr/share/fish/vendor_completions.d/swww.fish"

  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
