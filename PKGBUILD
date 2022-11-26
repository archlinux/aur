# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=streampager
pkgver=0.10.2
pkgrel=1
pkgdesc='A pager for command output or large files'
url='https://github.com/markbt/streampager'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/markbt/streampager/archive/v$pkgver.tar.gz")
sha256sums=('38f97ce65dd2231e5ec8ce06f6c3367fac04f13ad7b77d78b387f6a137f1e798')
b2sums=('1be04b231d21f96f8e9aff4575d2a3d3612e8de2a8bdbe3c8be3b8d5faee3766b56461f5e195b89247e098e8b4151a70db8d73d25db825599d8388995c73cea0')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR=target \
    cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/{sp,spp}

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
