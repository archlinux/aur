# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=streampager
pkgver=0.10.3
pkgrel=1
pkgdesc='A pager for command output or large files'
url='https://github.com/markbt/streampager'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('git' 'rust')
source=("$pkgname::git+https://github.com/markbt/streampager.git#commit=3c558526ce047e50530c2d89ca19b25f8424b4ab")
sha256sums=('SKIP')
b2sums=('SKIP')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"

  CARGO_TARGET_DIR=target \
    cargo build --release --frozen
}

package() {
  cd "$pkgname"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/{sp,spp}

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
