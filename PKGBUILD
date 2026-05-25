# Maintainer: Rui Jiang <ruidofm at gmail dot com>
pkgname=sdctl
pkgver=0.1.2
pkgrel=1
pkgdesc="An easy-to-use TUI for managing systemd units"
arch=('x86_64')
url="https://github.com/ruiiiijiiiiang/sdctl"
license=('MIT')
depends=('gcc-libs' 'glibc' 'systemd' 'polkit')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('417ce31c6db85252c7a43edde0cc9ef4644936164e6b0581f83c60a91c63a0f3')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
