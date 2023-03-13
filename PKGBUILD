# Maintainer: Marie Ramlow <me[at]nycode.dev>

pkgname=stellwerksim-rich-presence
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight Discord rich presence plugin for StellwerkSim"
url='https://github.com/NyCodeGHG/stellwerksim-rich-presence'
arch=('x86_64')
license=('GPL3')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c6b5b1ec376452a01795c6b541b5d0e106e890a8619b1a4e82e58e70cff124d9')
conflicts=('stellwerksim-rich-presence-bin')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
