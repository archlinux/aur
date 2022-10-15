# Maintainer: CosmicHorror <LovecraftianHorror@pm.me>

pkgname=cargo-auditable
pkgver=0.5.2
pkgrel=1
pkgdesc='A cargo-subcommand to make production Rust binaries auditable'
arch=(x86_64)
url="https://github.com/rust-secure-code/$pkgname"
license=(APACHE MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c9538ac743845346f2363c8cd3beb6af2673af4f63d7c0fba78934ffb820fca675094f4643b35345dab3191b59fdded2e6c1fccb29029455124476a1eab4bd09')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
