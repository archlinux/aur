pkgname=cachefetch
pkgver=0.1.0
pkgrel=1
pkgdesc="Get cache file sizes in your computer. Cross-platform Linux, Windows, MacOS supported."
arch=('x86_64')
url="https://github.com/ErenayDev/cachefetch"
license=('MIT')
depends=()
makedepends=('cargo')
source=("cachefetch-0.1.0.tar.gz::https://github.com/ErenayDev/cachefetch/archive/v0.1.0.tar.gz")
sha256sums=('478f4c102436bde8407db8844c0a4a67169da7f9d9ed876c0c4f7c8334f6880c')

prepare() {
  cd "cachefetch-0.1.0"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "cachefetch-0.1.0"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "cachefetch-0.1.0"
  install -Dm755 "target/release/cachefetch" "$pkgdir/usr/bin/cachefetch"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
