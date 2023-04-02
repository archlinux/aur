# Maintainer: CosmicHorror <LovecraftianHorror@pm.me>

pkgname=cargo-chef
pkgver=0.1.53
pkgrel=1
pkgdesc='A cargo-subcommand to speed up Rust Docker builds using Docker layer caching'
arch=(x86_64)
url="https://github.com/LukeMathWalker/$pkgname"
license=(APACHE MIT)
depends=(gcc-libs)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cf4bf596a6330ad8e26c115e5a48818c83039fb704eec44b54a15133ada92ee52d9a3646cae5e77509f7950c125f101edea75596dab6dd0d6fce5d6fdc15329d')

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
