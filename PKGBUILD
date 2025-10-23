# Maintainer: ThunderBlaze <darkthunderstormshiva@gmail.com>
pkgname=tsukiyomi-fetch
pkgver=0.1.2
pkgrel=1
pkgdesc="Custom configuration and statistics script for Fastfetch \(but can easily be integrated with other programs too\), designed to display personalized system and online profile stats in a clean and minimal way with cool icons"
arch=('x86_64')
url="https://github.com/thunder-blaze/$pkgname/tree/v$pkgver"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thunder-blaze/$pkgname/archive/refs/tags/v$pkgver.tar.gz")

prepare() {
  cd "$pkgname-$pkgver/tsukiyomi-fetch-rust"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver/tsukiyomi-fetch-rust"
  cargo build --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver/tsukiyomi-fetch-rust"
  install -Dm755 "target/release/$pkgname" "${pkgdir}/usr/bin/$pkgname"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/$pkgname/README.md"
}

sha256sums=('197cfef9080148a609d7d5733739df18c0ac75a0d544c8f8c7fca65723339659')
