# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=halofetch
pkgver=3.1.1
pkgrel=1
pkgdesc="System information fetch with centered logos, panels and a live monitor"
arch=('x86_64')
url="https://github.com/mafuzyk/halofetch"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('wireless_tools: show the Wi-Fi network name')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90e7d5368a4a5d79ae2e071b070c506829320f25d794a7d69b0f65ce88adeaed')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/halofetch "$pkgdir/usr/bin/halofetch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 DOCS.md "$pkgdir/usr/share/doc/$pkgname/DOCS.md"
}
