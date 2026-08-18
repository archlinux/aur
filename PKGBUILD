# Maintainer: A Farzat <a@farzat.xyz>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=mdbook-epub
pkgver=0.5.4
pkgrel=1
pkgdesc="An experimental mdbook backend for creating EPUB documents."
url="https://github.com/Michael-F-Bryan/mdbook-epub"
arch=(x86_64)
license=(MPL-2.0)
depends=(gcc-libs)
makedepends=(cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('22c1ac11e3f70eae9b101447c9b9df44a0d2b053013d363b652909902f1f5c52')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
