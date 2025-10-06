# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=tangled-cli
pkgname="$_pkgname-git"
pkgver=r7.gc1ea514
pkgrel=1
pkgdesc="Rust CLI for tangled.org"
arch=(any)
url="https://tangled.org/@vitorpy.com/tangled-cli"
license=("Custom:NONE")
makedepends=(cargo git)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=(
  "git+$url"
)
sha256sums=(
  'SKIP'
)

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${_pkgname}" || exit
  install -Dm0755 -t "$pkgdir/usr/bin/" target/release/tangled-cli
}
