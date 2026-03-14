# Maintainer: guilherme1628 <guilherme1628@users.noreply.github.com>
pkgname=ydrive
pkgver=1.0.0
pkgrel=1
pkgdesc="A Yazi-inspired TUI file manager for Google Drive"
arch=('x86_64' 'aarch64')
url="https://github.com/guilherme1628/ydrive"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
