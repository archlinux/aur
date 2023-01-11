# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=frigg
pkgver=0.2.0
pkgrel=1
pkgdesc="Download & decrypt stock firmwares for Samsung devices"
arch=('x86_64')
url="https://github.com/nickelc/frigg"
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nickelc/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f711b4a028fedac6eed1e8571522ea3c8fb05101130b8b9710ef91bcf3650f50754ccdd9953f7ede2f5fd85cca4cf5d7d73a783641431ffdd3e923d0a357dd9d')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --all-features
}

check() {
  cd "$pkgname-$pkgver"

  cargo test --release --locked --all-features
}

package() {
  cd "$pkgname-$pkgver"
  local OUT_DIR=$(<out_dir)

  install -Dm755 "target/release/frigg" "$pkgdir/usr/bin/frigg"
}
