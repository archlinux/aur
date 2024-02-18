# Maintainer: ldev <ldev dot eu dot org> 
pkgver=r2.cbac2cb
pkgrel=1

pkgname=git-credential-pass-git
pkgdesc="A simple git credentials helper for gnu pass"
license=('MIT')
url="https://github.com/Xgames123/git-credential-pass"
arch=('any')

binname=git-credential-pass
source=("git+$url#branch=dev")
conflicts=("git-credential-pass")
provides=("git-credential-pass")
makedepends=(
cargo
)
depends=(
  pass
)
md5sums=('SKIP')

pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/git-credential-pass"
    rm -f Cargo.lock
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch
}


build() {
    cd "$srcdir/git-credential-pass"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/git-credential-pass"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$binname"
}
