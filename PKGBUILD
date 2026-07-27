# Maintainer: vsk11-12
pkgname=tuiplay-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal music player built with Ratatui"
arch=('x86_64' 'aarch64')
url="https://github.com/vsk11-12/music-ratatui"
license=('MIT')
depends=('dbus' 'gcc-libs')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vsk11-12/music-ratatui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('426dc181780e2c07516f3ce37310637ca53f2697df2b720035f5bdc3e3dd39c8')

prepare() {
  cd "music-ratatui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "music-ratatui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "music-ratatui-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "music-ratatui-$pkgver"
  install -Dm755 "target/release/tuiplay" "$pkgdir/usr/bin/tuiplay"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
