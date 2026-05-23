# Maintainer: FlyInMyEye <iusearchlol at proton dot me>

pkgname=minipacked
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple tool to pack files and directories into portable (or even encrypted) containers written in rust'
arch=('x86_64')
url='https://github.com/FlyInMyEye/Minipacked'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d1ef219f9705dcf3fe12968eaf03e9e2540ff6a9cf26bf3ce2f436617e8f2f2f')

prepare() {
  cd "Minipacked-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  cargo fetch --locked
}

build() {
  cd "Minipacked-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "Minipacked-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR=target
  cargo test --frozen
}

package() {
  cd "Minipacked-$pkgver"

  install -Dm755 "target/release/minipack" "$pkgdir/usr/bin/minipack"
  install -Dm755 "target/release/minipacked" "$pkgdir/usr/bin/minipacked"
  install -Dm755 "target/release/miniunpack" "$pkgdir/usr/bin/miniunpack"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
