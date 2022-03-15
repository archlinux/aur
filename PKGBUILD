# Maintainer: Nikita Almakov <nikita.almakov@gmail.com>

pkgname=rate-mirrors
pkgver=0.9.1
pkgrel=1
pkgdesc="Everyday-use client-side map-aware mirror ranking tool"
url="https://github.com/westandskif/rate-mirrors"
license=('custom')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/westandskif/${pkgname}/archive/v${pkgver}.tar.gz")
arch=('any')
depends=('gcc-libs')
makedepends=('cargo')
sha512sums=('2109eb383bd8d1d3bf958147daa1fdc2443ecacab14f4efa55329bec2e7cacfee9ae246fbe30ac53fa108b94c3cfe8208f928806db0c2bb8b26d9e4e90373441')

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
