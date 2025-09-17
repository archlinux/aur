# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
pkgname=clisweeper
_repo=clisweeper
_cmd=clisweeper
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI client for minesweeper multiplayer"
arch=("x86_64")
url="https://github.com/WithoutAName25/$_repo"
license=("MIT")
depends=("gcc-libs" "glibc")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c37fb9a6279b2d8433d55175a3008dc8942e3b3da907ff63da60acdafb99307')
options=("!lto")

prepare() {
  cd "$srcdir/$_repo-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_repo-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features
}

package() {
  cd "$srcdir/$_repo-$pkgver"

  install -Dm755 "target/release/$_cmd" "$pkgdir/usr/bin/$_cmd"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
