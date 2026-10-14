pkgname=meloic
pkgver=0.4.0
pkgrel=1
pkgdesc="A good-looking terminal music player with real album covers, waveform, queue and themes"
arch=('x86_64' 'aarch64')
url="https://github.com/Huseynteymurzade28/meloic"
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f75dcac9a648d41cf1fa3da40b3cb60de20c0dd1833db2000f5d4f1ef6ceb69')

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
  install -Dm755 target/release/meloic "$pkgdir/usr/bin/meloic"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.md"
}
