# Maintainer: Yo'av Moshe <archlinux@yoavmoshe.com>
_pkgname=clapboard
pkgname=clapboard-git
pkgver=r2.d86a8a2
pkgrel=2
pkgdesc="Clipboard manager for Wayland"
url="https://github.com/bjesus/clapboard"
arch=("any")
license=("MIT")
depends=('wl-clipboard')
optdepends=('tofi: a recommended launcher')
makedepends=('rust')
source=("git+https://github.com/bjesus/$_pkgname.git")
sha512sums=("SKIP")

prepare() {
  mv $_pkgname/* .
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
