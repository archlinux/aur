# Maintainer: mafuzyk <mafuzyk@gmail.com>

pkgname=halofetch
pkgver=3.2.0
pkgrel=1
pkgdesc="System information fetch with centered logos, panels and a live monitor"
arch=('x86_64')
url="https://github.com/mafuzyk/halofetch"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('wireless_tools: show the Wi-Fi network name')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('32731f04bba23fcf065e26526aa3cab9ec629c271b60e0fbbd1b6061284367c2')

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
