# Maintainer: Traveling Salesman <traveling d°t salesman à zaclys d0t net>
pkgname=pacapply
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to declare installed packages as configuration, simplifying package management and system reinstallation."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://framagit.org/traveling_salesman/pacapply"
license=('GPL2')
groups=()
depends=('sudo')
makedepends=('git' 'cargo')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+https://framagit.org/traveling_salesman/pacapply#tag=${pkgver}")
noextract=()
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  install -Dm0755 -t "$pkgdir/usr/bin/" "${pkgname}/target/release/$pkgname"

  install -Dm644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
