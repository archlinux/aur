# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors
pkgver=0.7.0
pkgrel=1
pkgdesc="Everyday-use client-side map-aware mirror ranking tool"
url="https://github.com/westandskif/rate-mirrors"
license=('custom')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('x86_64')
depends=('gcc-libs')
makedepends=('cargo')
sha512sums=('c2270d261abc9a4f80687aac69b09783a0ed0b10be131b1b6eee003ea77b5229a6b25136cbbac968f8a43fb311e305a4d8895089049686b4cf1d71749aec34c9')

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/rate_mirrors" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

#vim: syntax=sh
