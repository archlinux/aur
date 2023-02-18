# Maintainer: Marie Ramlow <me[at]nycode.dev>

pkgname=cargo-leptos
pkgver=0.1.7
pkgrel=1
pkgdesc="Build tool for the rust framework leptos."
url='https://github.com/leptos-rs/cargo-leptos'
arch=('x86_64')
license=('MIT')
depends=('cargo' 'openssl' 'cargo-generate' 'binaryen')
optdepends=('dart-sass: sass support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b94d3118031f7de281c78d103ca8095f01af11534acdd7f1966f4ebc14798d50')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  # Build with no_downloads flag to let pacman handle dependencies.
  cargo build --frozen --release --features no_downloads
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
