# Maintainer: Aidan McConnon <aidanmcconnon210@gmail.com>
pkgname=rmap
pkgver=1.1.0
pkgrel=1
pkgdesc="sehr quick network scanner"
arch=('x86_64' 'aarch64')
url="https://github.com/PndaMan/rmap"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PndaMan/rmap/archive/v$pkgver.tar.gz")
sha256sums=('6afaa179f08bdc04aa9a2bf371f67f8654f2372aef69f7ad0646b3383ff6ee7e')

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
  install -Dm755 "target/release/rmap" "$pkgdir/usr/bin/rmap"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
