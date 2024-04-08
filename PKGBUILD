# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=terminusdm
pkgver=1.0.1
pkgrel=1
pkgdesc="Terminal download manager with a TUI"
arch=('x86_64')
url="https://github.com/sumoduduk/terminusdm"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4d4de440fb79fd48089b567d0e6acdd61626745be00583c617a72b0b6036a0b2')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

# check() {
#   cd "$pkgname-$pkgver"
#   cargo test --frozen --lib
# }

package() {
  cd $pkgname-$pkgver
  install -Dm755 target/release/$pkgname -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
