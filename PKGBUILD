# Maintainer: WithoutAName <withoutaname@withoutaname.eu>
pkgname=dot-manager
pkgver=0.2.2
pkgrel=1
pkgdesc="CLI Utility for easy dotfile management"
arch=("x86_64")
_repo=DotManager
url="https://github.com/WithoutAName25/$_repo"
license=("MIT")
depends=("gcc-libs" "glibc")
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("ce49db7d3f3daea05fd837003ece23b3fd0dd5defce019839c857f43439de25e")

prepare() {
  cd "$srcdir/$_repo-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$_repo-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$_repo-$pkgver"

  install -Dm755 target/release/dot-manager "$pkgdir/usr/bin/dot-manager"

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

