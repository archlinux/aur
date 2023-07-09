# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors
pkgver=0.15.3
pkgrel=1
pkgdesc="Everyday-use client-side map-aware mirror ranking tool"
url="https://github.com/westandskif/rate-mirrors"
license=('custom')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
depends=('gcc-libs')
makedepends=('cargo')
sha512sums=('54d537484464b71051041786178fdb782e6ef3536b6a9a4466425722ae0c5842ff43dec1dea9225fe505349bfb889804a2bd859a1219662ba0d4ef56e73cbaed')

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
