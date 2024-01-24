# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors
pkgver=0.17.1
pkgrel=1
pkgdesc="Everyday-use client-side map-aware mirror ranking tool"
url="https://github.com/westandskif/rate-mirrors"
license=('custom')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/rate_mirrors" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
sha256sums=('b50e677cbce8b85631f334bfa6578712c5933df04c869ce2494d94a32782b15c')
