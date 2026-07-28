# Maintainer: Haseeb Khalid <haseebkhalid1507@gmail.com>
pkgname=myx
pkgver=0.3.0
pkgrel=1
pkgdesc="A lean, beautiful terminal Spotify player"
arch=('x86_64' 'aarch64')
url="https://github.com/HaseebKhalid1507/Myx"
license=('MIT')
depends=('gcc-libs' 'alsa-lib' 'openssl')
makedepends=('cargo' 'alsa-lib' 'openssl')
options=(!lto)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f07558fd3fef07374d9f126bba5d7bdb00cc6fdf3f3008e5012e0527bd2ceef9')

prepare() {
  cd "Myx-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "Myx-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "Myx-$pkgver"
  install -Dm755 "target/release/myx" "$pkgdir/usr/bin/myx"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
