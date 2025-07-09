# Maintainer: Remi-Avec-Un-I <ri.jsp13@gmail.com>
pkgname=yaal
pkgver=1.0.6
pkgrel=1
pkgdesc="Yet Another Awesome Launcher"
arch=('x86_64')
url="https://github.com/Remi-Avec-Un-I/yaal"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Remi-Avec-Un-I/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('06948073fa07aaeb3fcd71835e7c182b00aba0e89166a1aaa1bcbaf05e25f77a')


prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

}




build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}


package() {
  cd "$pkgname-$pkgver"
  ls -la target/release
  install -Dm755 "target/release/yaal" "$pkgdir/usr/bin/yaal"
  install -Dm644 "yaal.desktop" "$pkgdir/usr/share/applications/yaal.desktop"
  
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/yaal/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/yaal/LICENSE"
} 
