# Maintainer:vishwanathbanglor@gmail.com
pkgname=disk-ui
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal UI disk usage analyzer written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/vsk11-12/disk-ui"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-targets
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
