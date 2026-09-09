# Maintainer: Haseeb Khalid <haseebkhalid1507@gmail.com>
pkgname=myx
pkgver=0.5.0
pkgrel=1
pkgdesc="A lean, beautiful terminal Spotify player"
arch=('x86_64' 'aarch64')
url="https://github.com/HaseebKhalid1507/Myx"
license=('MIT')
depends=('gcc-libs' 'alsa-lib' 'openssl')
makedepends=('cargo' 'alsa-lib' 'openssl')
options=(!lto)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('42c48a29910a44bca6eef52692a7f3774c80ceffed2c11c7a6b541b8cca645e3')

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
