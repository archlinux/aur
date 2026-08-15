# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=gimoji
pkgver=1.4.0
pkgrel=1
pkgdesc='Easily add emojis to your git commit messages 🎉'
arch=(x86_64)
url="https://github.com/zeenix/$pkgname"
license=(MIT)
depends=(glibc libgcc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('a908a6a61a95514d2cb9ddc4b9861a950d46c1684a405e17e974d949416ef8fdc0b57d1a1b3bdb6eca287c84b800917a8154a63dfe88f22173ecc1e623db09fd')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target="$(rustc --print host-tuple)"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vi: filetype=sh shiftwidth=2 expandtab
