# Maintainer: Your Name <youremail@domain.com>

pkgname=pict-rs
_pkgver=0.3.0-beta.5
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc="A simple image hosting service"
arch=('x86_64')
url="https://git.asonix.dog/asonix/pict-rs"
license=('AGPL3')
depends=('gcc-libs' 'imagemagick' 'ffmpeg' 'perl-image-exiftool')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha512sums=('d189bfdbf54702c0afa9e545f75b2ef5f98fb7a8bd4b253d839c03fa66b5593d6b975e5e2b26ed85b03ca3da42af3f0d2887bb4b2136f74847fb6b7031dd58f4')
b2sums=('1cbe01f636e6a53c260d1cf42c104de59be88b1401577899fae2e57221bcb48a29884c996d6bc02bb7fb0a40b4882c45ade63b4759aeee075117b82cd7e34b9f')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
