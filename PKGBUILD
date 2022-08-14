# Maintainer: Grzegorz Koperwas <admin@grzegorzkoperwas.site>
pkgname=swww
pkgver=0.4.1
pkgrel=0
pkgdesc="Efficient animated wallpaper daemon for wayland, controlled at runtime."
arch=('x86_64' 'aarch64')
url="https://github.com/Horus645/swww"
license=('GPL')
depends=('gcc-libs' 'lz4')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Horus645/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1faa54efde504b7b2b3300a853b87f9dd6c289d71439492bd03596bd8f3d042')

prepare() {
    cd "$pkgname-$pkgver"
    # tag v0.4.1 needs to write version to the lockfile
    cargo fetch --target "$CARCH-unknown-linux-gnu"
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
