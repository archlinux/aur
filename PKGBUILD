# Maintainer: CosmicHorror <CosmicHorrorDev@pm.me>

pkgname=gimoji
pkgver=1.3.0
pkgrel=1
pkgdesc='Easily add emojis to your git commit messages 🎉'
arch=(x86_64)
url="https://github.com/zeenix/$pkgname"
license=(MIT)
depends=(glibc libgcc)
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('e7f64f05edad6b6cb18d389c36666b79bfc23b53c9d09fe8b73e09a9a9cea3ee3f6295d15e4373bbc3b91c675ba427948ac2ecb730151a0a7e7b17450156b42f')

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
