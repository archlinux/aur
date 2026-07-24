# Maintainer: Haseeb Khalid <haseebkhalid1507@gmail.com>
pkgname=myx
pkgver=0.2.2
pkgrel=1
pkgdesc="A lean, beautiful terminal Spotify player"
arch=('x86_64' 'aarch64')
url="https://github.com/HaseebKhalid1507/Myx"
license=('MIT')
depends=('gcc-libs' 'alsa-lib' 'openssl')
makedepends=('cargo' 'alsa-lib' 'openssl')
options=(!lto)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c7ee4b2775bcb04105afd029f86b8f34662630b21d6349d85b1c7e4e42149d7')

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
